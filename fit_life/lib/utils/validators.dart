/** Crear una aplicación de registro Fit Life, para un gimnasio, para registro de usuarios nuevos. Crear formulario de inscripción y la pantalla de bienvenida que muestre los datos si todo salio bien.

Nombre por lo menos 4 letras
Mayor de 18 años
que el password minimo 6 caracteres y una mayuscula
que confirmen el password, que sean iguales


*/

class Validators {
  // Validacion de nombre
  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'El nombre es obligatorio.';
    }

    // Validar que tenga por lo menos 4 letras
    if (value.length < 4) {
      return 'El nombre debe tener al menos 4 letras.';
    }
    return null;
  }

  // Validacion de la edad
  static String? age(String? value) {
    if (value == null || value.isEmpty) {
      return 'La edad es obligatoria.';
    }
    // Convertir el valor a entero
    final age = int.tryParse(value);
    if (age == null) {
      return 'Por favor, ingrese una edad válida.';
    }
    // Validar que sea mayor de 18 años
    if (age < 18) {
      return 'Debes ser mayor de 18 años para registrarte.';
    }
    return null;
  }

  //Validacion de correo electrónico
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'El correo electrónico es obligatorio.';
    }
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Por favor, ingrese un correo electrónico válido.';
    }
    return null;
  }

  //Validacion de contraseña
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'La  contraseña es obligatoria.';
    }

    // Validar que tenga 6 caracteres como mínimo
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres.';
    }

    // Validar que contenga al menos una Mayuscula
    // La expresion r'(A-Z)' busca cualquier letra mayuscula del alfabeto ingles
    final hasUppercase = RegExp(r'[A-Z]');
    if (!hasUppercase.hasMatch(value)) {
      return 'La contraseña debe contener al menos una letra mayúscula.';
    }
    // Si todo esta correcto
    return null;
  }
}
