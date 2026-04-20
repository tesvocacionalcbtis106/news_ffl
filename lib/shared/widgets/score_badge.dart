import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ScoreBadge extends StatelessWidget {
  const ScoreBadge({
    super.key,
    required this.home,
    required this.away,
  });

  final int home;
  final int away;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.guinda.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.dorado),
      ),
      child: Text(
        '$home - $away',
        style: const TextStyle(
          color: AppColors.dorado,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
