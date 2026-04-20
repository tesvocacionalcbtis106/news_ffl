import 'package:flutter/material.dart';

import '../../shared/widgets/app_card.dart';
import '../../shared/widgets/section_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          SectionHeader(
            title: 'Acceso',
            subtitle: 'Autenticación para admins y árbitros',
          ),
          SizedBox(height: 12),
          AppCard(
            child: Column(
              children: [
                TextField(decoration: InputDecoration(labelText: 'Correo')),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(labelText: 'Contraseña'),
                  obscureText: true,
                ),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(onPressed: null, child: Text('Entrar')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
