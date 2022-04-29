import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class ContractLinking extends ChangeNotifier{
  final String _rpcUrl = "HTTP://10.0.2.2:7545";
  final String _wsUrl = "ws://10.0.2.2:7545/";
  final String _privateKey = "a0f30820624a6eace9370f28f4fb6903483e7bc8479591d76f4f6c467da89e4c";

  late Web3Client _client;
  bool isLoading = true;

  late String _abiCode1;
  late String _abiCode2;
  late EthereumAddress _contractAddress1;
  late EthereumAddress _contractAddress2;

  late Credentials _credentials;

  late DeployedContract _contract1;
  late DeployedContract _contract2;
  late ContractFunction _addLocation;
  late ContractFunction _getLocation;
  late ContractFunction _createUser;
  late ContractFunction _getUser;

  late String deployedName;

  ContractLinking() {
    initialSetup();
  }

  initialSetup() async {

    // establish a connection to the ethereum rpc node. The socketConnector
    // property allows more efficient event streams over websocket instead of
    // http-polls. However, the socketConnector property is experimental.
    _client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });

    await getAbi();
    await getCredentials();
    await getDeployedContract();
  }

  Future<void> getAbi() async {

    // Reading the contract abi
    String abiStringFile1 =
    await rootBundle.loadString("src/artifacts/Location.json");
    String abiStringFile2 =
    await rootBundle.loadString("src/artifacts/User.json");
    var jsonAbi1 = jsonDecode(abiStringFile1);
    var jsonAbi2 = jsonDecode(abiStringFile2);
    _abiCode1 = jsonEncode(jsonAbi1["abi"]);
    _abiCode2 = jsonEncode(jsonAbi2["abi"]);

    _contractAddress1 =
        EthereumAddress.fromHex(jsonAbi1["networks"]["5777"]["address"]);
    _contractAddress2 =
        EthereumAddress.fromHex(jsonAbi1["networks"]["5777"]["address"]);
  }

  Future<void>   getCredentials() async {
    // ignore: deprecated_member_use
    _credentials = await _client.credentialsFromPrivateKey(_privateKey);
  }

  Future<void> getDeployedContract() async {

    // Telling Web3dart where our contract is declared.
    _contract1 = DeployedContract(
        ContractAbi.fromJson(_abiCode1, "Location"), _contractAddress1);
    // Telling Web3dart where our contract is declared.
    _contract2 = DeployedContract(
        ContractAbi.fromJson(_abiCode2, "User"), _contractAddress2);

    // Extracting the functions, declared in contract.
    _addLocation = _contract1.function("addLocation");
    _getLocation = _contract1.function("getLocation");
    // _addLocation = _contract2.function("createUser");
    // _getLocation = _contract2.function("getUser");
    //addLocation();
  }

  getUser() async {

    // Getting the current name declared in the smart contract.
    var currentName = await _client
        .call(contract: _contract2, function: _getUser, params: []);
    deployedName = currentName[0];
    isLoading = false;
    notifyListeners();
  }

  createUser(String email, String username, String password, String tellNo) async {

    // Setting the name to nameToSet(name defined by user)
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract2, function: _createUser, parameters: [email, username, password, tellNo]));
    getUser();
  }

  getLocation() async {

    // Getting the current name declared in the smart contract.
    var currentName = await _client
        .call(contract: _contract1, function: _getLocation, params: []);
    deployedName = currentName[0];
    isLoading = false;
    notifyListeners();
  }

  addLocation(String locationName, String description, String longLat) async {

    // Setting the name to nameToSet(name defined by user)
    isLoading = true;
    notifyListeners();

    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract1, function: _addLocation, parameters: [locationName, description, longLat]));
    getLocation();
  }

}