import 'package:flutter/material.dart';

class DetailMahasiswa extends StatelessWidget {
  final String nama;
  final String npm;
  final String email;
  final String hp;
  final String gender;
  final String alamat;
  final String tanggalLahir;
  final String jamBimbingan;

  const DetailMahasiswa({
    super.key,
    required this.nama,
    required this.npm,
    required this.email,
    required this.hp,
    required this.gender,
    required this.alamat,
    required this.tanggalLahir,
    required this.jamBimbingan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Mahasiswa')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              'Data Mahasiswa',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            _buildRow('Nama', nama),
            _buildRow('NPM', npm),
            _buildRow('Email', email),
            _buildRow('Nomor HP', hp),
            _buildRow('Jenis Kelamin', gender),
            _buildRow('Alamat', alamat),
            _buildRow('Tanggal Lahir', tanggalLahir),
            _buildRow('Jam Bimbingan', jamBimbingan),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Kembali ke Form'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: Text('$label:')),
          Expanded(flex: 5, child: Text(value)),
        ],
      ),
    );
  }
}
