import 'package:practicaflutter/domain/models/user.dart';

abstract  class InterfaceUserRepository {
  Future<User> login(String nombreUsuario, String contrasena);

  Future<bool> register(User userRegister);
}