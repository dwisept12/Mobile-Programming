import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(const BeritaApp());

class BeritaApp extends StatelessWidget {
  const BeritaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Berita',
      home: BeritaPage(),
    );
  }
}

class BeritaPage extends StatelessWidget {
  final List<Map<String, String>> beritaList = [
    {
      "judul": "Reparasi Mobil",
      "deskripsi": "Artikel tentang tips merawat dan memperbaiki mobil.",
      "gambar": "gambar.jpeg"
    },
    {
      "judul": "Teknologi AI",
      "deskripsi": "Perkembangan terbaru dalam dunia Artificial Intelligence.",
      "gambar":
          "https://sbscyber.com/hs-fs/hubfs/Images/BlogImages/AdobeStock_604631734.jpeg?width=8000&height=4064&name=AdobeStock_604631734.jpeg"
    },
    {
      "judul": "Olahraga",
      "deskripsi": "Hasil pertandingan sepak bola terbaru.",
      "gambar":
          "https://awsimages.detik.net.id/community/media/visual/2024/04/26/timnas-indonesia-u-23-vs-korea-selatan-7.jpeg?w=1200"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Berita')),
      body: ListView.builder(
        itemCount: beritaList.length,
        itemBuilder: (context, index) {
          final berita = beritaList[index];
          return ListTile(
            leading: berita["gambar"]!.startsWith("http")
                ? CachedNetworkImage(
                    imageUrl: berita["gambar"]!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Image.asset(
                    "asset/${berita["gambar"]!}",
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
            title: Text(berita["judul"]!),
            subtitle: Text(berita["deskripsi"]!),
            trailing: const Icon(Icons.bookmark_border),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Mengalihkan ke halaman berita"),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
