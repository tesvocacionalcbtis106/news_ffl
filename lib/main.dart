import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FFL',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D0D0D),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _clockwiseTurns;
  late final Animation<double> _counterClockwiseTurns;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _clockwiseTurns = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    _counterClockwiseTurns = Tween<double>(begin: 0, end: -1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxHeight = constraints.maxHeight;
          final maxWidth = constraints.maxWidth;
          final shortestSide = constraints.biggest.shortestSide;
          final circleSize = shortestSide.clamp(220.0, 460.0);
          final glowSize = circleSize * 0.74;
          final logoSize = shortestSide.clamp(96.0, 170.0);
          final horizontalPadding = (maxWidth * 0.09).clamp(20.0, 90.0);
          final topInset = (maxHeight * 0.11).clamp(44.0, 120.0);
          final bottomInset = (maxHeight * 0.08).clamp(30.0, 70.0);
          final titleFontSize = shortestSide.clamp(28.0, 44.0);
          final titleSize = titleFontSize;
          final buttonWidth = maxWidth * 0.6;

          return Stack(
            children: [
              Positioned.fill(
                child: Container(color: const Color(0xFF0D0D0D)),
              ),

              // Title
              Positioned(
                top: topInset,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      'Bienvenido',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: titleSize,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'FFL',
                      style: TextStyle(
                        color: const Color(0xFFE53935),
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),

              // Logo
              Center(
                child: Image.asset(
                  'assets/logo_app.png',
                  width: logoSize,
                  fit: BoxFit.contain,
                ),
              ),

              // Decorative lines
              Positioned(
                left: 40,
                top: maxHeight * 0.12,
                child: _SlashLine(width: 280, color: const Color(0x33AA1D3A), angle: -0.29),
              ),
              Positioned(
                right: 0,
                top: maxHeight * 0.18,
                child: _SlashLine(width: 290, color: const Color(0x40AA1D3A), angle: -0.28),
              ),
              Positioned(
                left: maxWidth * 0.22,
                bottom: maxHeight * 0.28,
                child: _SlashLine(width: 340, color: const Color(0x33AA1D3A), angle: -0.42),
              ),

              // Button
              Positioned(
                left: horizontalPadding,
                right: horizontalPadding,
                bottom: bottomInset,
                child: SizedBox(
                  width: buttonWidth,
                  height: 58,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7E1530),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'EMPEZAR',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 4,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(width: 18),
                        Icon(Icons.arrow_forward, size: 28, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SlashLine extends StatelessWidget {
  const _SlashLine({
    required this.width,
    required this.color,
    required this.angle,
  });

  final double width;
  final Color color;
  final double angle;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        width: width,
        height: 2,
        color: color,
      ),
    );
  }
}

