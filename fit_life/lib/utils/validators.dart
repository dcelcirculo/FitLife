class Validators {
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
