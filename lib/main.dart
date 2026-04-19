import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FFL Onboarding',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D0D0D),
      ),
      home: const OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final shortestSide = constraints.biggest.shortestSide;
          final maxWidth = constraints.maxWidth;
          final maxHeight = constraints.maxHeight;

          final ringSize = shortestSide.clamp(260.0, 820.0);
          final titleSize = shortestSide.clamp(30.0, 58.0);
          final logoSize = shortestSide.clamp(120.0, 220.0);
          final buttonWidth = (maxWidth * 0.42).clamp(220.0, 380.0);

          return Stack(
            children: [
              Positioned.fill(
                child: Container(color: const Color(0xFF171A20)),
              ),

              Center(
                child: Container(
                  width: ringSize * 0.62,
                  height: ringSize * 0.62,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Color(0x4DFF8A00),
                        Color(0x0DFF8A00),
                        Colors.transparent,
                      ],
                      stops: [0.0, 0.55, 1.0],
                    ),
                  ),
                ),
              ),

              Center(
                child: _Ring(size: ringSize, color: const Color(0x33F5A700), stroke: 1.4),
              ),
              Center(
                child: _Ring(size: ringSize * 0.72, color: const Color(0x26F5A700), stroke: 1.2),
              ),
              Center(
                child: _Ring(size: ringSize * 0.45, color: const Color(0x1FFFFFFF), stroke: 1.1),
              ),

              Positioned(
                top: maxHeight * 0.18,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      'BIENVENIDO',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                        fontSize: titleSize,
                      ),
                    ),
                    Text(
                      'AL JUEGO',
                      style: TextStyle(
                        color: const Color(0xFFAA1D3A),
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                        fontSize: titleSize,
                      ),
                    ),
                  ],
                ),
              ),

              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: logoSize,
                  fit: BoxFit.contain,
                ),
              ),

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

              Positioned(
                left: 40,
                right: 40,
                bottom: maxHeight * 0.10,
                child: Center(
                  child: SizedBox(
                    width: buttonWidth,
                    height: 58,
                    child: ElevatedButton(
                      onPressed: () {},
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
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Ring extends StatelessWidget {
  const _Ring({required this.size, required this.color, required this.stroke});

  final double size;
  final Color color;
  final double stroke;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color, width: stroke),
      ),
    );
  }
}

class _SlashLine extends StatelessWidget {
  const _SlashLine({required this.width, required this.color, required this.angle});

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
