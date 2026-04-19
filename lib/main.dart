import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gaming Welcome',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF090A0D),
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _scaleAnimation = Tween<double>(begin: 0.92, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF10131A), Color(0xFF07080C)],
                ),
              ),
            ),
          ),
          Positioned.fill(child: CustomPaint(painter: _GamingBackgroundPainter())),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  Text(
                    'BIENVENIDO',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.orbitron(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Color(0xFFFF5F5F), Color(0xFF9F001D)],
                    ).createShader(bounds),
                    child: Text(
                      'AL JUEGO',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.orbitron(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  FadeTransition(
                    opacity: _fadeAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x99FF2E56),
                              blurRadius: 36,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'logo_app.png',
                          width: 180,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(flex: 3),
                  SizedBox(
                    width: 260,
                    height: 56,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x662C0008),
                            blurRadius: 18,
                            offset: Offset(0, 8),
                          ),
                        ],
                        gradient: const LinearGradient(
                          colors: [Color(0xFFB5122A), Color(0xFF6F0718)],
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) => const HomeScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'EMPEZAR →',
                          style: GoogleFonts.orbitron(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}

class _GamingBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = const Color(0x22FFFFFF)
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke;

    final accentPaint = Paint()
      ..color = const Color(0x30FF2E56)
      ..strokeWidth = 1.4
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
      Offset(size.width * 0.18, size.height * 0.2),
      size.width * 0.26,
      linePaint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.82, size.height * 0.78),
      size.width * 0.32,
      linePaint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.45),
      size.width * 0.42,
      accentPaint,
    );

    final path1 = Path()
      ..moveTo(size.width * 0.05, size.height * 0.2)
      ..lineTo(size.width * 0.95, size.height * 0.1)
      ..lineTo(size.width * 0.85, size.height * 0.13);
    canvas.drawPath(path1, accentPaint);

    final path2 = Path()
      ..moveTo(size.width * 0.1, size.height * 0.75)
      ..lineTo(size.width * 0.9, size.height * 0.85)
      ..lineTo(size.width * 0.8, size.height * 0.88);
    canvas.drawPath(path2, linePaint);

    final dotPaint = Paint()..color = const Color(0x33FF4D6D);
    for (var i = 0; i < 18; i++) {
      final dx = (size.width / 18) * i;
      canvas.drawCircle(Offset(dx, size.height * 0.56), 1.5, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
