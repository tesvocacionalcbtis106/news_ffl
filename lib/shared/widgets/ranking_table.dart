import 'package:flutter/material.dart';

class RankingEntry {
  const RankingEntry({
    required this.position,
    required this.name,
    required this.points,
  });

  final int position;
  final String name;
  final int points;
}

class RankingTable extends StatelessWidget {
  const RankingTable({
    super.key,
    required this.title,
    required this.entries,
  });

  final String title;
  final List<RankingEntry> entries;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Pos')),
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Pts')),
            ],
            rows: entries
                .map(
                  (entry) => DataRow(
                    cells: [
                      DataCell(Text('${entry.position}')),
                      DataCell(Text(entry.name)),
                      DataCell(Text('${entry.points}')),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
