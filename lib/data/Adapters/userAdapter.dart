import 'package:practicaflutter/data/Adapters/modelAdapters.dart';
import 'package:practicaflutter/data/DTO/usersDTO.dart';
import 'package:practicaflutter/domain/models/user.dart';

class UsuarioAdaptador extends ModelAdapter<User, usersDTO> {
  @override
  usersDTO fromModel(User model) {
    // TODO: implement fromModel
    usersDTO newUser = usersDTO(nombre:model.nombre, apellido:model.apellido, edad:model.edad, profesion:model.profesion, contrasena:model.contrasena);
    return newUser;
  }

  @override
  User toModel(usersDTO external) {
    // TODO: implement toModel
    User allUser = User(external.nombre,external.apellido,external.edad,external.profesion,external.contrasena);
    return allUser;
  }
  List<User> listDtoToListModel(List<usersDTO> externalList) {
    List<User> listUsers = [];
    if (externalList.isNotEmpty) {
      externalList.forEach((element) {
        listUsers.add(this.toModel(element));
      });
    }
    return listUsers;
  }

 
}