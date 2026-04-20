import 'package:flutter/material.dart';

import '../../shared/widgets/section_header.dart';

class JornadasScreen extends StatelessWidget {
  const JornadasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SectionHeader(
        title: 'Jornadas',
        subtitle: 'Gestión de jornadas por fechas',
      ),
    );
  }
}
