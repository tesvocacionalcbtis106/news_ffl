import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CountdownWidget extends StatelessWidget {
  const CountdownWidget({
    super.key,
    required this.label,
    required this.remaining,
  });

  final String label;
  final Duration remaining;

  @override
  Widget build(BuildContext context) {
    final days = remaining.inDays;
    final hours = remaining.inHours.remainder(24);

    return Row(
      children: [
        const Icon(Icons.schedule, color: AppColors.dorado),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            '$label: faltan $days días y $hours horas',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
