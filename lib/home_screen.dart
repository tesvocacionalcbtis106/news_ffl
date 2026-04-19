import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final standings = [
      ('Tigres', '12-4', '.750', '+5.0'),
      ('Leones', '10-6', '.625', '+3.0'),
      ('Águilas', '9-7', '.563', '+2.0'),
      ('Toros', '8-8', '.500', '+1.0'),
      ('Lobos', '6-10', '.375', '-2.0'),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.image_outlined, color: Colors.black54),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.dark_mode_outlined),
                    color: Colors.black87,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.person_outline),
                    color: Colors.black87,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Lo Destacado',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFD6D6D6),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Icon(Icons.image, size: 58, color: Colors.black45),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'NOTICIAS',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                'Info',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: const [
                  Text(
                    'Posiciones',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Ver Más',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  children: [
                    const _StandingsHeader(),
                    const Divider(height: 12),
                    ...standings
                        .map(
                          (team) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: _StandingRow(
                              team: team.$1,
                              gp: team.$2,
                              pct: team.$3,
                              diff: team.$4,
                            ),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Games'),
          BottomNavigationBarItem(icon: Icon(Icons.flag_outlined), label: 'Posiciones'),
          BottomNavigationBarItem(icon: Icon(Icons.description_outlined), label: 'Noticias'),
        ],
      ),
    );
  }
}

class _StandingsHeader extends StatelessWidget {
  const _StandingsHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 3, child: Text('EQUIPO', style: TextStyle(fontWeight: FontWeight.bold))),
        Expanded(child: Text('G-P', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold))),
        Expanded(child: Text('%', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold))),
        Expanded(child: Text('DIF', textAlign: TextAlign.end, style: TextStyle(fontWeight: FontWeight.bold))),
      ],
    );
  }
}

class _StandingRow extends StatelessWidget {
  const _StandingRow({
    required this.team,
    required this.gp,
    required this.pct,
    required this.diff,
  });

  final String team;
  final String gp;
  final String pct;
  final String diff;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: Text(team, style: const TextStyle(color: Colors.black87))),
        Expanded(child: Text(gp, textAlign: TextAlign.center)),
        Expanded(child: Text(pct, textAlign: TextAlign.center)),
        Expanded(child: Text(diff, textAlign: TextAlign.end)),
      ],
    );
  }
}
