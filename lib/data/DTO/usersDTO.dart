import 'package:practicaflutter/UI/bloc/user/user_bloc.dart';

class usersDTO{
  final String nombre;
  final String apellido;
  final int edad;
  final String profesion;
  final String contrasena; 
  usersDTO(
    {this.nombre,
    this.apellido,
    this.edad,
    this.profesion,
    this.contrasena,}
  );
  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'apellido': apellido,
      'edad':edad,
      'profesion': profesion,
      'contrasena': contrasena,
    };
  }

  factory usersDTO.fromMap(Map<String, dynamic> map) {
    return usersDTO(
      nombre: map['nombre'] ?? '',
      apellido : map['apellido'] ?? '',
      edad: map['edad'] ?? '',
      profesion: map['profesion'] ?? '',
      contrasena: map['contrasena'] ?? '',
    );
  }
  static List<usersDTO> listMapToListDto(List<dynamic> list) {
    List<usersDTO> listusersDTO = [];
    if (list.isNotEmpty) {
      list.forEach((element) {
        listusersDTO.add(usersDTO.fromMap(element.data()));
      });
    }
    return listusersDTO;
  }
}