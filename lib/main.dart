import 'package:flutter/material.dart';
import 'package:flutter_geo_sample/pages/home.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter QR Code Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage('QR Code Sample'),
    );
  }
}
