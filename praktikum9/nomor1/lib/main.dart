import 'package:flutter/material.dart';
import 'kucing.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Kucing kucing1 = Kucing('Tom', 4.0, 'Abu-abu');
    String makan = kucing1.makan(200);
    return MaterialApp(
        home: Scaffold(
        appBar: AppBar(
          title: Text('Latihan'),
        ),
        body: Center(
          child: Text(
            makan,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}