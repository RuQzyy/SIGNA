import 'package:flutter/material.dart';
import 'package:bahasaku/screens/home/home_screen.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;

  void _onPageChangeCallback(int activePageIndex) {
    setState(() {
      _currentPage = activePageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final pages = [
      OnboardingPage(
        image: "assets/images/1.jpg",
        title: "Selamat Datang",
        description:
            "Aplikasi penerjemah bahasa isyarat menjadi suara secara real-time",
        button: _nextButton(),
      ),
      OnboardingPage(
        image: "assets/images/1.jpg",
        title: "Terjemahkan Gerakan",
        description:
            "Arahkan kamera dan biarkan aplikasi menerjemahkan bahasa isyarat Anda",
        button: _nextButton(),
      ),
      OnboardingPage(
        image: "assets/images/1.jpg",
        title: "Belajar Bahasa Isyarat",
        description:
            "Pelajari bahasa isyarat melalui video dan animasi interaktif",
        button: _startButton(),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // ================= LIQUID SWIPE =================
          LiquidSwipe(
            pages: pages,
            onPageChangeCallback: _onPageChangeCallback,
            waveType: WaveType.circularReveal, // 🔥 liquid asli
            fullTransitionValue: 880,
            slideIconWidget: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            enableLoop: false,
            positionSlideIcon: 0.5,
          ),

          // ================= LOGO (IKUT SWIPE) =================
          Positioned(
            top: height * 0.20,
            left: 0,
            right: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: Column(
                key: ValueKey(_currentPage),
                children: [
                  ClipOval(
                    child: Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/images/logo.jpeg',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'SIGNA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ================= DOT INDICATOR =================
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: _buildDots(),
          ),
        ],
      ),
    );
  }

  // ================= DOTS =================
  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        final isActive = _currentPage == index;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: isActive ? 16 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? Colors.black : Color.fromARGB(137, 101, 70, 212),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  // ================= BUTTONS =================
  Widget _nextButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Text("Next"),
    );
  }

  Widget _startButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Text("Mulai Aplikasi"),
    );
  }
}
