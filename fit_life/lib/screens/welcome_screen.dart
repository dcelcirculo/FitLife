import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String name;
  final String age;
  final String email;

  const WelcomeScreen({
    super.key,
    required this.name,
    required this.age,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.deepPurpleAccent,
              size: 100,
            ),
            Text(
              '¡Registro Exitoso!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            Card(
              margin: EdgeInsets.all(16.0),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Nombre'),
                    subtitle: Text(name),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.cake),
                    title: Text('Edad'),
                    subtitle: Text(age),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text('Correo Electrónico'),
                    subtitle: Text(email),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
