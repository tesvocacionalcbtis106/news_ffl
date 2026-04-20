import 'package:flutter/material.dart';

import '../../modules/auth/login_screen.dart';
import '../../modules/equipos/equipos_screen.dart';
import '../../modules/games/games_screen.dart';
import '../../modules/home/home_screen.dart';
import '../../modules/jugadores/jugadores_screen.dart';

class AppRoutes {
  static const String root = '/';
  static const String home = '/home';
  static const String games = '/games';
  static const String jugadores = '/jugadores';
  static const String equipos = '/equipos';
  static const String login = '/login';
}

class AppRouter {
  static Map<String, WidgetBuilder> get routes => {
        AppRoutes.root: (_) => const MainShell(),
        AppRoutes.home: (_) => const MainShell(initialIndex: 0),
        AppRoutes.games: (_) => const MainShell(initialIndex: 1),
        AppRoutes.jugadores: (_) => const MainShell(initialIndex: 2),
        AppRoutes.equipos: (_) => const MainShell(initialIndex: 3),
        AppRoutes.login: (_) => const LoginScreen(),
      };
}

class MainShell extends StatefulWidget {
  const MainShell({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  late int _index;

  final _screens = const [
    HomeScreen(),
    GamesScreen(),
    JugadoresScreen(),
    EquiposScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FFL'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.login),
            child: const Text('Login', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: _screens[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.sports), label: 'Juegos'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Jugadores'),
          NavigationDestination(icon: Icon(Icons.groups), label: 'Equipos'),
        ],
      ),
    );
  }
}
