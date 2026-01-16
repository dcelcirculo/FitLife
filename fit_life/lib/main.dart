import 'dart:io';

import 'package:fit_life/screens/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/** Crear una aplicación de registro Fit Life, para un gimnasio, para registro de usuarios nuevos. Crear formulario de inscripción y la pantalla de bienvenida que muestre los datos si todo salio bien.

Nombre por lo menos 4 letras
Mayor de 18 años
que el password minimo 6 caracteres y una mayuscula
que confirmen el password, que sean iguales


*/
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fit Life',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const LoginScreen(),
    );
  }
}
