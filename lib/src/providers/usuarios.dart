class DatosUsuarios {
  final String id;
  final String nombre;
  final String apellido;
  final String usuario;

  DatosUsuarios({ this.id='', this.nombre='', this.apellido='', this.usuario=''});

  factory DatosUsuarios.fromJson(Map<String, dynamic> json) {
    return DatosUsuarios(
      id: json['_id'] as String,
      nombre: json['nombre'] as String,
      apellido: json['apellido'] as String,
      usuario: json['usuario'] as String
    );
  }
}