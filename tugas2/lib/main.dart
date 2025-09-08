import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'input_mahasiswa_page.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Map<String, dynamic>? mahasiswa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Latihan 1
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
              child: const Text("Go to Profile Page"),
            ),
            const SizedBox(height: 16),

            // Latihan 2
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InputMahasiswaPage(),
                  ),
                );

                if (result != null) {
                  setState(() {
                    mahasiswa = result;
                  });
                }
              },
              child: const Text("Input Data Mahasiswa"),
            ),
            const SizedBox(height: 16),

            // Tampilkan data mahasiswa jika sudah ada
            if (mahasiswa != null) ...[
              Text("Nama: ${mahasiswa!["nama"]}"),
              Text("Umur: ${mahasiswa!["umur"]}"),
              Text("Alamat: ${mahasiswa!["alamat"]}"),
              Text("Kontak: ${mahasiswa!["kontak"]}"),
              const SizedBox(height: 16),

              // Latihan 3
              ElevatedButton(
                onPressed: () async {
                  if (mahasiswa != null && mahasiswa!["kontak"] != null) {
                    final Uri telUri = Uri(
                      scheme: 'tel',
                      path: mahasiswa!["kontak"],
                    );

                    if (await canLaunchUrl(telUri)) {
                      await launchUrl(telUri, mode: LaunchMode.externalApplication);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Tidak bisa membuka aplikasi telepon"),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Nomor mahasiswa tidak tersedia"),
                      ),
                    );
                  }
                },
                child: const Text("Call Mahasiswa"),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
