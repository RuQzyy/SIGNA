import 'package:flutter/material.dart';
import 'package:bahasaku/widgets/top_curve_clipper.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final Widget button;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ================= IMAGE BACKGROUND =================
          Positioned.fill(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),

          // ================= WHITE CARD (FIX) =================
          Positioned(
            left: 0,
            right: 0,
            bottom: 0, // ⬅️ NEMPEL KE BAWAH (TIDAK ADA RUANG KOSONG)
            child: ClipPath(
              clipper: TopCurveClipper(),
              child: Container(
                height: height * 0.5, // bisa 0.45 – 0.55
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 30,
                      offset: const Offset(0, -10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 80),

                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 12),

                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const Spacer(),

                    button,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
