import 'package:flutter/material.dart';
import 'dart:async';

import 'package:leanplum_flutter/leanplum_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initSDK();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initSDK() async {
    LeanplumFlutter.setDeviceId('yourCustomDeviceId');
    LeanplumFlutter.start(userId: '12345');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Leanplun SDK'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            LeanplumFlutter.setAppVersion('1.0');
            LeanplumFlutter.setUserId('122121');
            },
          child: Icon(Icons.star),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
