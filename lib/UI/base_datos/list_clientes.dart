class Clientes {
  int? id;
  String nombre;
  String apellidos;
  String password;
  String rePassword;
  String dni;
  String email;
  String isAdmin;
  String viewHistory;

  Clientes({
    this.id,
    required this.nombre,
    required this.apellidos,
    required this.password,
    required this.rePassword,
    required this.dni,
    required this.email,
    required this.isAdmin,
    required this.viewHistory,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'apellidos': apellidos,
      'contrasena': password,
      'comfirmarContrasena': rePassword,
      'dni': dni,
      'email': email,
      'isAdmin': isAdmin,
      'viewHistory': viewHistory,
    };
  }
}
