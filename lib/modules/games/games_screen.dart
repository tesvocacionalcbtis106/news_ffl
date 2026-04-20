import 'package:flutter/material.dart';

import '../../shared/widgets/section_header.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SectionHeader(
        title: 'Juegos',
        subtitle: 'Calendario, resultados y marcador en vivo',
      ),
    );
  }
}
