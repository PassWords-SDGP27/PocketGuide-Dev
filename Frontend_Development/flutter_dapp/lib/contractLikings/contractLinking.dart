import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class ContractLinking extends ChangeNotifier {
  final String _rpcUrl = "HTTP://10.0.2.2:7545";
  final String _wsUrl = "ws://10.0.2.2:7545/";

  //final String _privateKey = "cbc704639d8eaaa639d026aebddbdec9595fb0dbf172c78f2754fbbf4767a4b2";

  final String _owner_private_key =
      "cbc704639d8eaaa639d026aebddbdec9595fb0dbf172c78f2754fbbf4767a4b2"; //Metamask - Account 2, Ganache Account 1
  final String _user1_private_key =
      "277245588c69f25be5f820eeb396814e91220adcaa153e7e6e6cdcc33e2502a2"; //Metamask - Account 3, Ganache Account 2
  final String _contract1Address =
      "0xE079bce145C1228811B2F334ad77336fd2F2BC3C"; //location contract
  final String _contract2Address =
      "0xE079bce145C1228811B2F334ad77336fd2F2BC3C"; //user contract

  late Web3Client _client;
  bool isLoading = true;

  late Credentials _credentials;

  late String deployedName;

  ContractLinking() {
    initialSetup();
  }

  initialSetup() async {
    _client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });

    // await getAbi();
    // await getCredentials();
    // await getDeployedContract();
  }
  
  //loading location contract
  Future<DeployedContract> loadContract1() async {
    String abiStringFile1 =
    await rootBundle.loadString("src/artifacts/Location.json");
    String contract1Address = _contract1Address;
    final contract = DeployedContract(
        ContractAbi.fromJson(abiStringFile1, 'Location'),
        EthereumAddress.fromHex(contract1Address));
    return contract;
  }

  //loading user contract
  Future<DeployedContract> loadContract2() async {
    String abiStringFile2 =
    await rootBundle.loadString("src/artifacts/User.json");
    String contract2Address = _contract2Address;
    final contract = DeployedContract(
        ContractAbi.fromJson(abiStringFile2, 'User'),
        EthereumAddress.fromHex(contract2Address));
    return contract;
  }

  //calling functions in backend location Contract
  Future<String> callFunctionInContract1(String funcName, List<dynamic> args,
      Web3Client ethClient, String privateKey) async {
    EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
    DeployedContract contract1 = await loadContract1();
    final ethFunction = contract1.function(funcName);
    final result = await ethClient.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: contract1, function: ethFunction, parameters: args),
        chainId: null,
        fetchChainIdFromNetworkId: true);
    return result;
  }

  //calling functions in backend user Contract
  Future<String> callFunctionInContract2(String funcName, List<dynamic> args,
      Web3Client ethClient, String privateKey) async {
    EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
    DeployedContract contract2 = await loadContract2();
    final ethFunction = contract2.function(funcName);
    final result = await ethClient.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: contract2, function: ethFunction, parameters: args),
        chainId: null,
        fetchChainIdFromNetworkId: true);
    return result;
  }

  //create user up function
  Future<String> createUser(String email, String username, String password,
      String tellNo, Web3Client ethClient) async {
    var response = await callFunctionInContract2('createUser',
        [email, username, password, tellNo], ethClient, _user1_private_key);
    print('User created successfully');
    return response;
  }

  //login user
  Future<String> login(String password, Web3Client ethClient) async {
    var response = await callFunctionInContract2(
        'login', [password], ethClient, _user1_private_key);
    print('User logged in successfully');
    return response;
  }

  //add location
  Future<String> addLocation(String locationName, String locationDesc, String longLat, Web3Client ethClient) async {
    var response = await callFunctionInContract1(
        'addLocation', [locationName, locationDesc, longLat], ethClient, _user1_private_key);
    print('Location added successfully');
    return response;
  }

  //view location description
  Future<String> viewDesc(String locationName, Web3Client ethClient) async {
    var response = await callFunctionInContract1(
        'viewDesc ', [locationName], ethClient, _user1_private_key);
    print(response);
    return response;
  }

  //view location longitude and latitude
  Future<String> viewLongLat (String locationName, Web3Client ethClient) async {
    var response = await callFunctionInContract1(
        'viewLongLat', [locationName], ethClient, _user1_private_key);
    print(response);
    return response;
  }

  //verify location
  Future<String> verifyLocation (String locationName, Web3Client ethClient) async {
    var response = await callFunctionInContract1(
        'verifyLocation', [locationName], ethClient, _user1_private_key);
    print("Verified location");
    return response;
  }

}
