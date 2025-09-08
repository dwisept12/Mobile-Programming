import 'package:flutter/material.dart';

class InputMahasiswaPage extends StatefulWidget {
  const InputMahasiswaPage({super.key});

  @override
  State<InputMahasiswaPage> createState() => _InputMahasiswaPageState();
}

class _InputMahasiswaPageState extends State<InputMahasiswaPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _umurController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _kontakController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Input Mahasiswa")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: "Nama"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Nama wajib diisi" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _umurController,
                decoration: const InputDecoration(labelText: "Umur"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Umur wajib diisi";
                  }
                  if (int.tryParse(value) == null) {
                    return "Umur harus angka";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _alamatController,
                decoration: const InputDecoration(labelText: "Alamat"),
                validator: (value) => value == null || value.isEmpty
                    ? "Alamat wajib diisi"
                    : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _kontakController,
                decoration: const InputDecoration(labelText: "Kontak (No HP)"),
                keyboardType: TextInputType.phone,
                validator: (value) => value == null || value.isEmpty
                    ? "Kontak wajib diisi"
                    : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final mahasiswa = {
                      "nama": _namaController.text,
                      "umur": int.parse(_umurController.text),
                      "alamat": _alamatController.text,
                      "kontak": _kontakController.text,
                    };
                    Navigator.pop(context, mahasiswa);
                  }
                },
                child: const Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
