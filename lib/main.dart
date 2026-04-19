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
      title: 'Gaming Onboarding',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D0D0D),
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
          final shortestSide = constraints.biggest.shortestSide;
          final circleSize = shortestSide.clamp(220.0, 460.0);
          final glowSize = circleSize * 0.74;
          final logoSize = shortestSide.clamp(96.0, 170.0);
          final horizontalPadding = (constraints.maxWidth * 0.09).clamp(20.0, 90.0);
          final topInset = (constraints.maxHeight * 0.11).clamp(44.0, 120.0);
          final bottomInset = (constraints.maxHeight * 0.08).clamp(30.0, 70.0);
          final titleFontSize = shortestSide.clamp(28.0, 44.0);

          return Stack(
            children: [
              Positioned.fill(
                child: Container(color: const Color(0xFF0D0D0D)),
              ),

              Positioned(
                top: topInset,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      'BIENVENIDO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'AL JUEGO',
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

              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: glowSize,
                      height: glowSize,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          radius: 0.9,
                          colors: [
                            Color(0x44E53935),
                            Color(0x00E53935),
                          ],
                          stops: [0.0, 1.0],
                        ),
                      ),
                    ),

                    RotationTransition(
                      turns: _clockwiseTurns,
                      child: Container(
                        width: circleSize,
                        height: circleSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0x99E53935),
                            width: 2,
                          ),
                        ),
                      ),
                    ),

                    RotationTransition(
                      turns: _counterClockwiseTurns,
                      child: Container(
                        width: circleSize * 0.78,
                        height: circleSize * 0.78,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0x55FFFFFF),
                            width: 1.6,
                          ),
                        ),
                      ),
                    ),

                    Image.asset(
                      'assets/images/logo.png',
                      width: logoSize,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),

              Positioned(
                left: horizontalPadding,
                right: horizontalPadding,
                bottom: bottomInset,
                child: SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFC62828),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        letterSpacing: 1.0,
                      ),
                    ),
                    child: const Text('EMPEZAR'),
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