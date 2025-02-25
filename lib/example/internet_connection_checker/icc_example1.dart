import 'package:example/custom_widget/internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/material.dart';

class IccExample1 extends StatefulWidget {
  const IccExample1({super.key});

  @override
  State<IccExample1> createState() => _IccExample1State();
}

class _IccExample1State extends State<IccExample1> {
  bool _isConnected = false;
  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }
  Future<void> checkInternetConnection() async {
    final isConnected = await InternetConnectionChecker().hasConnection;
    setState(() {
      _isConnected = isConnected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          _isConnected == false ? 'Ishlamayapti' : 'Ishlayapti',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
