import 'package:flutter/material.dart';

import 'shared/navigation/app_router.dart';
import 'shared/theme/app_theme.dart';

/// Stack definido para el proyecto: Flutter + Firebase.
void main() {
  runApp(const FflApp());
}

class FflApp extends StatelessWidget {
  const FflApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FFL',
      theme: AppTheme.dark,
      initialRoute: AppRoutes.root,
      routes: AppRouter.routes,
    );
  }
}
