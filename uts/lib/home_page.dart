import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> notes;
  const HomePage({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    if (notes.isEmpty) {
      return const Center(
        child: Text(
          "Belum ada catatan.\nTambahkan dari menu 'Tambah'.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
          child: ListTile(
            leading: const Icon(Icons.note, color: Colors.blue),
            title: Text(notes[index]["title"] ?? ""),
            subtitle: Text(notes[index]["content"] ?? ""),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.orange),
                  tooltip: 'Edit',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Edit catatan: ${notes[index]["title"] ?? ""}',
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  tooltip: 'Hapus',
                  onPressed: () async {
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Hapus Catatan'),
                        content: const Text(
                          'Apakah Anda yakin ingin menghapus catatan ini?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(false),
                            child: const Text('Batal'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(ctx).pop(true),
                            child: const Text('Hapus'),
                          ),
                        ],
                      ),
                    );

                    if (confirm == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Catatan dihapus: ${notes[index]["title"] ?? ""}',
                          ),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(width: 8),
                Text("Catatan ${index + 1}"),
              ],
            ),
          ),
        );
      },
    );
  }
}
