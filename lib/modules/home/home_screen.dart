import 'package:flutter/material.dart';

import '../../shared/widgets/app_card.dart';
import '../../shared/widgets/countdown_widget.dart';
import '../../shared/widgets/ranking_table.dart';
import '../../shared/widgets/score_badge.dart';
import '../../shared/widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionHeader(
          title: 'Home',
          subtitle: 'Resumen general de la liga',
        ),
        const SizedBox(height: 12),
        const AppCard(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Partido actual: Leones vs Tigres'),
              ScoreBadge(home: 14, away: 12),
            ],
          ),
        ),
        const SizedBox(height: 12),
        AppCard(
          child: RankingTable(
            title: 'Top jugadores',
            entries: const [
              RankingEntry(position: 1, name: 'Carlos Méndez', points: 93),
              RankingEntry(position: 2, name: 'Luis Navarro', points: 84),
              RankingEntry(position: 3, name: 'Jorge Ruiz', points: 77),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const AppCard(
          child: CountdownWidget(
            label: 'Próxima jornada',
            remaining: Duration(days: 5, hours: 3),
          ),
        ),
      ],
    );
  }
}
