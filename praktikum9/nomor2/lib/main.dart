import 'package:flutter/material.dart';
import 'hewan.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HewanPage(),
    );
  }
}

class HewanPage extends StatefulWidget {
  @override
  State<HewanPage> createState() => _HewanPageState();
}

class _HewanPageState extends State<HewanPage> {
  Hewan hewan = Hewan("Sapi", 80.0); // contoh hewan

  void tambahMakan() {
    setState(() {
      hewan.makan(1.0); // tambah 1 kg
    });
  }

  void kurangiLari() {
    setState(() {
      hewan.lari(0.5); // kurang 0.5 kg
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latihan 2 - Berat Hewan"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Berat ${hewan.nama}: ${hewan.berat.toStringAsFixed(1)} kg",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: tambahMakan,
              child: const Text("Makan (+1 kg)"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: kurangiLari,
              child: const Text("Lari (-0.5 kg)"),
            ),
          ],
        ),
      ),
    );
  }
}
