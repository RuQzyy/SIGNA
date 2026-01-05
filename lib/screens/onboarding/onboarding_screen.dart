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
  final LiquidController _liquidController = LiquidController();
  int _currentPage = 0;

  void _onPageChangeCallback(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _liquidController.animateToPage(
        page: _currentPage + 1,
        duration: 500,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
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
        image: "assets/images/2.jpg",
        title: "Terjemahkan Gerakan",
        description:
            "Arahkan kamera dan biarkan aplikasi menerjemahkan bahasa isyarat Anda",
        button: _nextButton(),
      ),
      OnboardingPage(
        image: "assets/images/3.jpg",
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
          // ================= LIQUID SWIPE  =================
          ClipRect( 
            child: LiquidSwipe(
              pages: pages,
              liquidController: _liquidController,
              onPageChangeCallback: _onPageChangeCallback,
              waveType: WaveType.liquidReveal,
              fullTransitionValue: 1200, 
              enableLoop: false,
              enableSideReveal: false,
              ignoreUserGestureWhileAnimating: true,
              slideIconWidget: const SizedBox(), 
            ),
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
            color: isActive ? Colors.black : Color.fromARGB(137, 58, 56, 158),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }

  // ================= BUTTONS =================
  Widget _nextButton() {
    return ElevatedButton(
      onPressed: _nextPage,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Text("Swipe"),
    );
  }

  Widget _startButton() {
    return Material(
      color: Colors.black,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: _nextPage,
        child: const SizedBox(
          height: 50,
          width: double.infinity,
          child: Center(
            child: Text(
              "Mulai Aplikasi",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
