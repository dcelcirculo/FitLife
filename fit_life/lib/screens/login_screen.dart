import 'package:flutter/material.dart';
import '../utils/validators.dart';
import 'welcome_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key}); // Constructor

  @override
  State<LoginScreen> createState() => _LoginScreenState(); // Create state
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey =
      GlobalKey<
        FormState
      >(); // Uso de una clave global para controlar el formulario

  String _password = ''; // Variable para almacenar la contraseña ingresada
  String _confirmPassword = ''; // Variable para confirmar la contraseña

  final _isFormValidNotifier = ValueNotifier<bool>(
    false,
  ); // Notificador o controlador para el estado de validez del botón
  bool _isObscure =
      true; // Variable para controlar la visibilidad de la contraseña
  final TextEditingController _nameController =
      TextEditingController(); // Controlador de texto para el campo de nombre
  final TextEditingController _ageController =
      TextEditingController(); // Controlador de texto para el campo de edad
  final TextEditingController _emailController =
      TextEditingController(); // Controlador de texto para el campo de email
  final TextEditingController _passwordController =
      TextEditingController(); // Controlador de texto para el campo de contraseña
  final TextEditingController _confirmPasswordController =
      TextEditingController(); // Controlador de texto para el campo de confirmación de contraseña

  // Método para validar el formulario en tiempo real
  void _validateForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    _isFormValidNotifier.value = isValid;
  }

  @override
  void dispose() {
    // Liberar recursos
    _nameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _isFormValidNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            24.0,
          ), // Agrega un padding alrededor del formulario
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //LOGO O TITULO
              const Icon(
                Icons.fitness_center,
                size: 80,
                color: Colors.deepPurpleAccent,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Bienvenido a Fit Life',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              const Text(
                'Registrate para continuar',
                style: TextStyle(color: Colors.deepPurple),
              ),
              const SizedBox(height: 40.0),

              //Formulario de inicio de sesión
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey, // Asocia la clave global al formulario
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Nombre Completo',
                          prefixIcon: Icon(Icons.person_2_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        // Aquí se utiliza el validador importado desde validators.dart
                        validator: Validators.name,
                        onChanged: (_) => _validateForm(),
                      ),

                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _ageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Edad',
                          prefixIcon: Icon(Icons.cake_rounded),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: Validators.age,
                        onChanged: (_) => _validateForm(),
                      ),

                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Correo Electrónico',
                          prefixIcon: Icon(Icons.email_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        // Aquí se utiliza el validador importado desde validators.dart
                        validator: Validators.email,
                        onChanged: (_) => _validateForm(),
                      ),

                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          labelText: 'Ingrese su Contraseña',
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: Validators.password,

                        // Guardar la contraseña ingresada
                        onChanged: (value) {
                          _password = value;
                          _validateForm();
                        },
                      ),

                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          labelText: 'Confirme su Contraseña',
                          prefixIcon: Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        validator: (value) =>
                            Validators.confirmPassword(_password, value),

                        // Guardar la confirmación de contraseña ingresada
                        onChanged: (value) {
                          _confirmPassword = value;
                          _validateForm();
                        },
                      ),

                      const SizedBox(height: 30.0),

                      //Boton de inicio de sesión
                      ValueListenableBuilder<bool>(
                        valueListenable: _isFormValidNotifier,
                        builder: (context, isValid, child) {
                          return SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isValid
                                    ? Colors.deepPurpleAccent
                                    : Colors.grey,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: isValid
                                  ? () {
                                      //Acción al presionar el botón
                                      if (_formKey.currentState!.validate()) {
                                        // Si el formulario es válido, mostrar un snackbar
                                        // ScaffoldMessenger.of(
                                        //   context,
                                        // ).showSnackBar(
                                        //   const SnackBar(
                                        //     content: Text(
                                        //       'Inicio de sesión exitoso',
                                        //     ),
                                        //     backgroundColor: Colors.grey,
                                        //   ),
                                        // );
                                        // Navegar a la pantalla de bienvenida
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => WelcomeScreen(
                                              name: _nameController.text,
                                              age: _ageController.text,
                                              email: _emailController.text,
                                            ),
                                          ),
                                        );
                                        //Aquí llamarías a tu servicio de autenticación
                                      }
                                    }
                                  : null,
                              child: const Text(
                                'Ingresar',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
