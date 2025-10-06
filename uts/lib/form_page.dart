import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  final Function(String, String) onSubmit;
  const FormPage({super.key, required this.onSubmit});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Tambah Catatan Baru",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: "Judul Catatan",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Judul tidak boleh kosong!";
                }
                if (value.length < 3) {
                  return "Minimal 3 karakter!";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _contentController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Isi Catatan",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Isi catatan tidak boleh kosong!";
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.onSubmit(
                    _titleController.text,
                    _contentController.text,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Catatan berhasil ditambahkan!"),
                      backgroundColor: Colors.green,
                    ),
                  );

                  _titleController.clear();
                  _contentController.clear();
                }
              },
              icon: const Icon(Icons.save),
              label: const Text("Simpan Catatan"),
            )
          ],
        ),
      ),
    );
  }
}
