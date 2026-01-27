import 'package:flutter/material.dart';
import 'materi.dart';

class MateriScreen extends StatefulWidget {
  const MateriScreen({super.key});

  @override
  State<MateriScreen> createState() => _MateriScreenState();
}

class _MateriScreenState extends State<MateriScreen> {
  String? kategoriTerpilih;

  @override
  Widget build(BuildContext context) {
    // ================= TAMPIL HALAMAN MATERI =================
    if (kategoriTerpilih != null) {
      return MateriPage(
        kategoriNama: kategoriTerpilih!,
        onBack: () {
          setState(() {
            kategoriTerpilih = null;
          });
        },
      );
    }

    // ================= HALAMAN KATEGORI =================
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          // ================= HEADER =================
          Container(
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
            decoration: const BoxDecoration(
              color: Color(0xFF2F6F6A),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  "Kategori Materi",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Pilih kategori untuk mulai belajar",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ================= LIST KATEGORI =================
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: kategoriData.length,
              itemBuilder: (context, index) {
                final kategori = kategoriData[index];

                return KategoriCard(
                  kategoriNama: kategori['nama'],
                  jumlahMateri: kategori['jumlah'],
                  onLihat: () {
                    setState(() {
                      kategoriTerpilih = kategori['nama'];
                    });
                  },
                  onDownload: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Download kategori ${kategori['nama']}",
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//
// ================= CARD KATEGORI =================
//
class KategoriCard extends StatelessWidget {
  final String kategoriNama;
  final int jumlahMateri;
  final VoidCallback onLihat;
  final VoidCallback onDownload;

  const KategoriCard({
    super.key,
    required this.kategoriNama,
    required this.jumlahMateri,
    required this.onLihat,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFF2F6F6A).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.menu_book,
              color: Color(0xFF2F6F6A),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kategoriNama,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "$jumlahMateri materi",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.download, size: 20),
            color: Colors.grey,
            onPressed: onDownload,
          ),
          TextButton(
            onPressed: onLihat,
            child: const Text(
              "Lihat",
              style: TextStyle(
                color: Color(0xFF2F6F6A),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//
// ================= DATA KATEGORI =================
//
final List<Map<String, dynamic>> kategoriData = [
  {"nama": "Salam", "jumlah": 12},
  {"nama": "Percakapan", "jumlah": 18},
  {"nama": "Huruf", "jumlah": 26},
  {"nama": "Angka", "jumlah": 10},
];
