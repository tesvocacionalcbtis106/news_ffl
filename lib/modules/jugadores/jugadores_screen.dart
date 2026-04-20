import 'package:flutter/material.dart';

import '../../shared/widgets/section_header.dart';

class JugadoresScreen extends StatelessWidget {
  const JugadoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SectionHeader(
        title: 'Jugadores',
        subtitle: 'Estadísticas, ranking y perfiles',
      ),
    );
  }
}
