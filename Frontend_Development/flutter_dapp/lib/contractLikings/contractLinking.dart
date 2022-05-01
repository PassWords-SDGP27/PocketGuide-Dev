import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class ContractLinking extends ChangeNotifier{
  final String _rpcUrl = "HTTP://10.0.2.2:7545";
  final String _wsUrl = "ws://10.0.2.2:7545/";
  //final String _privateKey = "cbc704639d8eaaa639d026aebddbdec9595fb0dbf172c78f2754fbbf4767a4b2";

  final String _owner_private_key = "cbc704639d8eaaa639d026aebddbdec9595fb0dbf172c78f2754fbbf4767a4b2"; //Metamask - Account 2, Ganache Account 1
  final String _user1_private_key = "277245588c69f25be5f820eeb396814e91220adcaa153e7e6e6cdcc33e2502a2"; //Metamask - Account 3, Ganache Account 2
  final String _contract1Address = "0xE079bce145C1228811B2F334ad77336fd2F2BC3C";//location contract
  final String _contract2Address = "0xE079bce145C1228811B2F334ad77336fd2F2BC3C";//0x016fD2E2b455Ff49188c9d23A1caACCaC8585220

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

  //***********************************************************************
  //loading location contract
  Future<DeployedContract> loadContract1() async{
    String abiStringFile1 = await rootBundle.loadString("src/artifacts/Location.json");
    String contract1Address = _contract1Address;
    final contract = DeployedContract(ContractAbi.fromJson(abiStringFile1, 'Location'), EthereumAddress.fromHex(contract1Address));
    return contract;
  }

  //loading user contract
  Future<DeployedContract> loadContract2() async{
    String abiStringFile2 = await rootBundle.loadString("src/artifacts/User.json");
    String contract2Address = _contract2Address;
    final contract = DeployedContract(ContractAbi.fromJson(abiStringFile2, 'User'), EthereumAddress.fromHex(contract2Address));
    return contract;
  }

  //calling functions in backend location Contract
  Future<String> callFunctionInContract1(String funcName, List<dynamic> args, Web3Client ethClient, String privateKey) async {
    EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
    DeployedContract contract1 = await loadContract1();
    final ethFunction = contract1.function(funcName);
    final result = await ethClient.sendTransaction(_credentials, Transaction.callContract(contract: contract1, function: ethFunction, parameters: args));
    return result;
  }

  //calling functions in backend user Contract
  Future<String> callFunctionInContract2(String funcName, List<dynamic> args, Web3Client ethClient, String privateKey) async {
    EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
    DeployedContract contract2 = await loadContract2();
    final ethFunction = contract2.function(funcName);
    final result = await ethClient.sendTransaction(_credentials, Transaction.callContract(contract: contract2, function: ethFunction, parameters: args));
    return result;
  }

  //create user up function
  Future<String> createUser(String email, String username, String password, String tellNo, Web3Client ethClient) async {
    var response = await callFunctionInContract1('createUser', [email, username, password, tellNo], ethClient, _user1_private_key);
    print('User created successfully');
    return response;
  }

  //login user
  Future<String> login(String password, Web3Client ethClient) async {
    var response = await callFunctionInContract1('login', [password], ethClient, _user1_private_key);
    print('User logged in successfully');
    return response;
  }
  //***********************************************************************

  initialSetup() async {

    // establish a connection to the ethereum rpc node. The socketConnector
    // property allows more efficient event streams over websocket instead of
    // http-polls. However, the socketConnector property is experimental.
    _client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });

    // await getAbi();
    // await getCredentials();
    // await getDeployedContract();
  }
  //
  // Future<void> getAbi() async {
  //
  //   // Reading the contract abi
  //   String abiStringFile1 =
  //   await rootBundle.loadString("src/artifacts/Location.json");
  //   String abiStringFile2 =
  //   await rootBundle.loadString("src/artifacts/User.json");
  //   var jsonAbi1 = jsonDecode(abiStringFile1);
  //   var jsonAbi2 = jsonDecode(abiStringFile2);
  //   _abiCode1 = jsonEncode(jsonAbi1["abi"]);
  //   _abiCode2 = jsonEncode(jsonAbi2["abi"]);
  //
  //   _contractAddress1 =
  //       EthereumAddress.fromHex(jsonAbi1["networks"]["5777"]["address"]);
  //   _contractAddress2 =
  //       EthereumAddress.fromHex(jsonAbi2["networks"]["5777"]["address"]);
  // }
  //
  // Future<void>   getCredentials() async {
  //   // ignore: deprecated_member_use
  //   _credentials = await _client.credentialsFromPrivateKey(_owner_private_key);
  // }
  //
  // Future<void> getDeployedContract() async {
  //
  //   // Telling Web3dart where our contract is declared.
  //   _contract1 = DeployedContract(
  //       ContractAbi.fromJson(_abiCode1, "Location"), _contractAddress1);
  //   // Telling Web3dart where our contract is declared.
  //   _contract2 = DeployedContract(
  //       ContractAbi.fromJson(_abiCode2, "User"), _contractAddress2);
  //
  //   // Extracting the functions, declared in contract.
  //   /*_addLocation = _contract1.function("addLocation");
  //   _getLocation = _contract1.function("getLocation");
  //   _createUser = _contract2.function("createUser");
  //   _getUser = _contract2.function("getUser");*/
  //
  //   // _addLocation = _contract2.function("createUser");
  //   // _getLocation = _contract2.function("getUser");
  //   //addLocation();
  // }
  //
  //
  // getUser() async {
  //
  //   // Getting the current name declared in the smart contract.
  //   var currentName = await _client
  //       .call(contract: _contract2, function: _getUser, params: []);
  //   deployedName = currentName[0];
  //   isLoading = false;
  //   notifyListeners();
  // }
  //
  // createUser(String email, String username, String password, String tellNo) async {
  //
  //   // Setting the name to nameToSet(name defined by user)
  //   isLoading = true;
  //   notifyListeners();
  //   await _client.sendTransaction(
  //       _credentials,
  //       Transaction.callContract(
  //           contract: _contract2, function: _createUser, parameters: [email, username, password, tellNo]));
  //   getUser();
  // }
  //
  // getLocation() async {
  //
  //   // Getting the current name declared in the smart contract.
  //   var currentName = await _client
  //       .call(contract: _contract1, function: _getLocation, params: []);
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
  //           contract: _contract1, function: _addLocation, parameters: [locationName, description, longLat]));
  //   getLocation();
  // }

}