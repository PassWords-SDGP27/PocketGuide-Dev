import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class ContractLinking extends ChangeNotifier{
  final String _rpcUrl = "HTTP://10.0.2.2:7545";
  final String _wsUrl = "ws://10.0.2.2:7545/";
  final String _privateKey = "6718ec30cbf0a4df3a7d9a679c4db993652f09b666c9f408cb9259bcce6ade9a";

  late Web3Client _client;
  bool isLoading = true;

  late String _abiCode;
  late EthereumAddress _contractAddress;

  late Credentials _credentials;

  late DeployedContract _contract;
  late ContractFunction _addLocation;
  late ContractFunction _getLocation;

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
    String abiStringFile =
    await rootBundle.loadString("src/artifacts/Location.json");
    var jsonAbi = jsonDecode(abiStringFile);
    _abiCode = jsonEncode(jsonAbi["abi"]);

    _contractAddress =
        EthereumAddress.fromHex(jsonAbi["networks"]["5777"]["address"]);
  }

  Future<void>   getCredentials() async {
    // ignore: deprecated_member_use
    _credentials = await _client.credentialsFromPrivateKey(_privateKey);
  }

  Future<void> getDeployedContract() async {

    // Telling Web3dart where our contract is declared.
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode, "Location"), _contractAddress);

    // Extracting the functions, declared in contract.
    _addLocation = _contract.function("addLocation");
    _getLocation = _contract.function("getLocation");
    //addLocation();
  }

  getLocation() async {

    // Getting the current name declared in the smart contract.
    var currentName = await _client
        .call(contract: _contract, function: _yourName, params: []);
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
            contract: _contract, function: _createUser, parameters: [email, username, password, tellNo]));

  }

  // getLocation() async {
  //
  //   // Getting the current name declared in the smart contract.
  //   var currentName = await _client
  //       .call(contract: _contract, function: _getLocation, params: []);
  //   deployedName = currentName[0];
  //   isLoading = false;
  //   notifyListeners();
  // }
  //
  // addLocation(String locationName, String description, String longLat) async {
  //
  //   // Setting the name to nameToSet(name defined by user)
  //   isLoading = true;
  //   notifyListeners();
  //
  //   await _client.sendTransaction(
  //       _credentials,
  //       Transaction.callContract(
  //           contract: _contract, function: _addLocation, parameters: [locationName, description, longLat]));
  //   getLocation();
  // }

}