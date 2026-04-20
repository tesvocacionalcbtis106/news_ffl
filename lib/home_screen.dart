import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFF0D0D0D);
    const surfaceColor = Color(0xFF1A1A1A);
    const guinda = Color(0xFF7E1530);
    const dorado = Color(0xFFD4AF37);

    final players = [
      ('Carlos Méndez', 'Tigres', 18.6, 93),
      ('Luis Navarro', 'Leones', 16.8, 84),
      ('Jorge Ruiz', 'Halcones', 15.4, 77),
      ('Pedro Salas', 'Toros', 14.2, 71),
      ('Miguel Ponce', 'Lobos', 12.4, 62),
      ('Andrés Vega', 'Panteras', 11.0, 55),
    ];

    final teams = [
      ('Tigres', 'Carlos Méndez', '6', '5', '0', '1', '148', '95', '+53', '15'),
      ('Leones', 'Luis Navarro', '6', '4', '1', '1', '133', '101', '+32', '13'),
      ('Halcones', 'Jorge Ruiz', '6', '4', '0', '2', '122', '108', '+14', '12'),
      ('Toros', 'Pedro Salas', '6', '3', '1', '2', '118', '116', '+2', '10'),
      ('Lobos', 'Miguel Ponce', '6', '2', '1', '3', '106', '120', '-14', '7'),
    ];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Color(0x26D4AF37))),
              ),
              child: Row(
                children: const [
                  Text(
                    'FFL',
                    style: TextStyle(
                      color: dorado,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'FLAG FOOTBALL LEAGUE',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _PanelContainer(
                      title: 'Panel de Jugadores',
                      subtitle: 'Ranking del mejor valorado al peor valorado',
                      guinda: guinda,
                      dorado: dorado,
                      surfaceColor: surfaceColor,
                      child: SizedBox(
                        height: 290,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const _PlayersHeader(),
                              const Divider(color: Colors.white24),
                              ...players.asMap().entries.map(
                                (entry) {
                                  final rank = entry.key + 1;
                                  final p = entry.value;
                                  return _PlayersRow(
                                    rank: rank,
                                    name: p.$1,
                                    team: p.$2,
                                    avgPoints: p.$3,
                                    totalPoints: p.$4,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _PanelContainer(
                      title: 'Panel de Equipos',
                      subtitle: 'Tabla general con estadísticas',
                      guinda: guinda,
                      dorado: dorado,
                      surfaceColor: surfaceColor,
                      child: SizedBox(
                        height: 290,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: 860,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const _TeamsHeader(),
                                  const Divider(color: Colors.white24),
                                  ...teams.asMap().entries.map(
                                    (entry) {
                                      final rank = entry.key + 1;
                                      final t = entry.value;
                                      return _TeamsRow(
                                        rank: rank,
                                        name: t.$1,
                                        captain: t.$2,
                                        pj: t.$3,
                                        pg: t.$4,
                                        pe: t.$5,
                                        pp: t.$6,
                                        pf: t.$7,
                                        pc: t.$8,
                                        dif: t.$9,
                                        totalPoints: t.$10,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _PanelContainer(
                      title: 'Panel de Jornadas',
                      subtitle: 'Actual, siguiente jornada e historial',
                      guinda: guinda,
                      dorado: dorado,
                      surfaceColor: surfaceColor,
                      child: Column(
                        children: const [
                          _InfoCard(
                            title: 'Jornada Actual',
                            detail:
                                'Tigres vs Leones | Marcador: 14 - 12 | Tiempo: 12:47\nTemporizador activo, 2 tiempos libres por equipo por cada mitad.\nBotón de finalizar disponible solo para árbitro.',
                          ),
                          SizedBox(height: 10),
                          _InfoCard(
                            title: 'Siguiente Jornada',
                            detail:
                                'Sábado 25 abril - 18:00\nToros vs Halcones (faltan 5 días 3 horas)\nLobos vs Panteras (faltan 5 días 5 horas)',
                          ),
                          SizedBox(height: 10),
                          _InfoCard(
                            title: 'Historial',
                            detail:
                                'Jornada 5: Tigres 28 - 14 Toros\nJornada 5: Leones 21 - 21 Halcones\nBotón: "Resumen de Partido" para ver anotadores y MVP por equipo.',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _PanelContainer(
                      title: 'Agg Equipos',
                      subtitle: 'Formulario rápido para alta de equipos',
                      guinda: guinda,
                      dorado: dorado,
                      surfaceColor: surfaceColor,
                      child: Column(
                        children: const [
                          _FieldPlaceholder(label: 'Nombre del equipo'),
                          SizedBox(height: 10),
                          _FieldPlaceholder(label: 'Capitán'),
                          SizedBox(height: 10),
                          _FieldPlaceholder(label: 'Contador automático de integrantes'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _PanelContainer(
                      title: 'Contador General',
                      subtitle: 'Equipos y jugadores registrados',
                      guinda: guinda,
                      dorado: dorado,
                      surfaceColor: surfaceColor,
                      child: const Row(
                        children: [
                          Expanded(
                            child: _CounterCard(label: 'Equipos', value: '6'),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: _CounterCard(label: 'Jugadores', value: '72'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: surfaceColor,
        selectedItemColor: dorado,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_football), label: 'Jornadas'),
          BottomNavigationBarItem(icon: Icon(Icons.groups_2), label: 'Equipos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Jugadores'),
        ],
      ),
    );
  }
}

class _PanelContainer extends StatelessWidget {
  const _PanelContainer({
    required this.title,
    required this.subtitle,
    required this.child,
    required this.guinda,
    required this.dorado,
    required this.surfaceColor,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final Color guinda;
  final Color dorado;
  final Color surfaceColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0x267E1530)),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 28,
                color: guinda,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: dorado,
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

class _PlayersHeader extends StatelessWidget {
  const _PlayersHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(width: 28, child: Text('#', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
        Expanded(flex: 3, child: Text('Nombre', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
        Expanded(flex: 2, child: Text('Equipo', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
        Expanded(child: Text('Prom.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
        Expanded(child: Text('Total', textAlign: TextAlign.end, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
      ],
    );
  }
}

class _PlayersRow extends StatelessWidget {
  const _PlayersRow({
    required this.rank,
    required this.name,
    required this.team,
    required this.avgPoints,
    required this.totalPoints,
  });

  final int rank;
  final String name;
  final String team;
  final double avgPoints;
  final int totalPoints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          SizedBox(width: 28, child: Text('$rank', style: const TextStyle(color: Colors.white70))),
          Expanded(flex: 3, child: Text(name, style: const TextStyle(color: Colors.white70))),
          Expanded(flex: 2, child: Text(team, style: const TextStyle(color: Colors.white70))),
          Expanded(child: Text(avgPoints.toStringAsFixed(1), textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70))),
          Expanded(child: Text('$totalPoints', textAlign: TextAlign.end, style: const TextStyle(color: Colors.white70))),
        ],
      ),
    );
  }
}

class _TeamsHeader extends StatelessWidget {
  const _TeamsHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(width: 26, child: Text('#', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
        Expanded(flex: 2, child: Text('Nombre', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
        Expanded(flex: 2, child: Text('Capitán', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
        Expanded(child: Text('PJ', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
        Expanded(child: Text('PG', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
        Expanded(child: Text('PE', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
        Expanded(child: Text('PP', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
        Expanded(child: Text('PF', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
        Expanded(child: Text('PC', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
        Expanded(child: Text('DIF', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
        Expanded(child: Text('PTS', textAlign: TextAlign.end, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700))),
      ],
    );
  }
}

class _TeamsRow extends StatelessWidget {
  const _TeamsRow({
    required this.rank,
    required this.name,
    required this.captain,
    required this.pj,
    required this.pg,
    required this.pe,
    required this.pp,
    required this.pf,
    required this.pc,
    required this.dif,
    required this.totalPoints,
  });

  final int rank;
  final String name;
  final String captain;
  final String pj;
  final String pg;
  final String pe;
  final String pp;
  final String pf;
  final String pc;
  final String dif;
  final String totalPoints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          SizedBox(width: 26, child: Text('$rank', style: const TextStyle(color: Colors.white70))),
          Expanded(flex: 2, child: Text(name, style: const TextStyle(color: Colors.white70))),
          Expanded(flex: 2, child: Text(captain, style: const TextStyle(color: Colors.white70))),
          Expanded(child: Text(pj, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70))),
          Expanded(child: Text(pg, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70))),
          Expanded(child: Text(pe, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70))),
          Expanded(child: Text(pp, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70))),
          Expanded(child: Text(pf, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70))),
          Expanded(child: Text(pc, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70))),
          Expanded(child: Text(dif, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70))),
          Expanded(child: Text(totalPoints, textAlign: TextAlign.end, style: const TextStyle(color: Colors.white70))),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.title, required this.detail});

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF141414),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0x26D4AF37)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFD4AF37),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(detail, style: const TextStyle(color: Colors.white70, height: 1.35)),
        ],
      ),
    );
  }
}

class _FieldPlaceholder extends StatelessWidget {
  const _FieldPlaceholder({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFF141414),
        border: Border.all(color: const Color(0x267E1530)),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white60),
      ),
    );
  }
}

class _CounterCard extends StatelessWidget {
  const _CounterCard({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF141414),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0x26D4AF37)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFFD4AF37),
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
