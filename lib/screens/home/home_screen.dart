import 'package:flutter/material.dart';
import '../../layouts/navbar.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        top:false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ================= HEADER =================
              Container(
                padding: const EdgeInsets.fromLTRB(16, 32, 16, 24),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFB2F0F7),
                      Color(0xFFF5F5F5),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Logo
                    Image.asset(
                      'assets/images/logo2.png',
                      height: 120,
                    ),

                    const SizedBox(height: 24),

                    // ================= MAIN CARD =================
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2F6F6A),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Row(
                        children: [

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pelatihan Bahasa Isyarat",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Pelajari dan terjemahkan bahasa isyarat secara interaktif dan mudah dipahami.",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 12),

                          CircleAvatar(
                            radius: 36,
                            backgroundColor: Colors.white24,
                            child: Icon(
                              Icons.pan_tool_alt,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ================= SECTION 1 =================
              // MODE PEMBELAJARAN
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Mode Pembelajaran",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: ModeCard(
                        title: "Belajar\nBahasa Isyarat",
                        icon: Icons.school,
                        color: Color(0xFF2F6F6A),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: ModeCard(
                        title: "Terjemahkan\nBahasa Isyarat",
                        icon: Icons.camera_alt,
                        color: Color(0xFF4DB6AC),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // ================= SECTION 2 =================
              // KATEGORI MATERI
                          Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Text(
                      "Kategori Materi",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Spacer(),

                    TextButton(
                        onPressed: () {
                          NavbarLayout.of(context)?.goToPage(2);
                        },

                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        "Lihat Semua",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: categoryData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: CategoryCard(
                        title: categoryData[index]['title'],
                        subtitle: categoryData[index]['subtitle'],
                        icon: categoryData[index]['icon'],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

//
// ================= MODE CARD =================
//
class ModeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const ModeCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 32),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

//
// ================= CATEGORY CARD =================
//
class CategoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const CategoryCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.teal[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(icon, color: Colors.teal, size: 36),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            subtitle,
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),

          const SizedBox(height: 4),

          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(),

          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: const Size(60, 30),
              ),
              onPressed: () {},
              child: const Text(
                "Lihat",
                style: TextStyle(color: Colors.white),
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
final List<Map<String, dynamic>> categoryData = [
  {
    'title': 'Alfabet Isyarat',
    'subtitle': 'Huruf A–Z',
    'icon': Icons.text_fields,
  },
  {
    'title': 'Bahasa Sehari-hari',
    'subtitle': 'Kosakata Umum',
    'icon': Icons.chat,
  },
  {
    'title': 'Bahasa Sapaan',
    'subtitle': 'Interaksi Sosial',
    'icon': Icons.waving_hand,
  },
  {
    'title': 'Kalimat Dasar',
    'subtitle': 'Komunikasi Dasar',
    'icon': Icons.record_voice_over,
  },
];
