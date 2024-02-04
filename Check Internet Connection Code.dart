import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var connectivityResult;

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

  Future<void> checkInternetConnection() async {
    connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      print("No Internet Connection");
    } else if (connectivityResult == ConnectivityResult.mobile) {
      print("Mobile Network Connection");
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print("WiFi Connection");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internet Connection Checker'),
      ),
      body: Center(
        child: Text(
          'Internet Connection Status: $connectivityResult',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
