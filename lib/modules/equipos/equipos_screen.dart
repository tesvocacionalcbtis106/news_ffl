import 'package:flutter/material.dart';

import '../../shared/widgets/section_header.dart';

class EquiposScreen extends StatelessWidget {
  const EquiposScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SectionHeader(
        title: 'Equipos',
        subtitle: 'Plantillas y rendimiento por equipo',
      ),
    );
  }
}
