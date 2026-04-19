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
      title: 'News FFL',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D0D0D),
        useMaterial3: true,
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
                    const Text(
                      'NEWS',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                        fontSize: 48, // Scaled later
                      ),
                    ),
                    Text(
                      'FFL',
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
                  'logo_app.png',
                  width: logoSize,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: logoSize,
                      height: logoSize,
                      color: Colors.grey,
                      child: const Icon(Icons.image_not_supported, color: Colors.white, size: 50),
                    );
                  },
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
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => const NewsScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7E1530),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 8,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'EMPEZAR',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 12),
                          Icon(Icons.arrow_forward_ios, size: 20, color: Colors.white),
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

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final List<Map<String, String>> newsItems = [
    {'title': 'Últimas noticias FFL 2024', 'subtitle': 'Temporada inicia con cambios importantes', 'image': 'logo_app.png'},
    {'title': 'Equipo campeón confirmado', 'subtitle': 'Fantasy Football League domina', 'image': 'logo_app.png'},
    {'title': 'Nuevos jugadores destacados', 'subtitle': 'Rookies que debes considerar', 'image': 'logo_app.png'},
    {'title': 'Estrategias ganadoras', 'subtitle': 'Consejos para la semana 1', 'image': 'logo_app.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News FFL'),
        backgroundColor: const Color(0xFF171A20),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {}); // Simulate refresh
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: newsItems.length,
        itemBuilder: (context, index) {
          final item = newsItems[index];
          return Card(
            color: const Color(0xFF1E1E1E),
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Image.asset(
                item['image']!,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 60,
                  height: 60,
                  color: Colors.grey,
                ),
              ),
              title: Text(
                item['title']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                item['subtitle']!,
                style: TextStyle(color: Colors.grey[400]),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Abriendo noticia: ${item['title']}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _Ring extends StatelessWidget {
  const _Ring({
    required this.size,
    required this.color,
    required this.stroke,
  });

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

