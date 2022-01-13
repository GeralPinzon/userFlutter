import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practicaflutter/data/Adapters/userAdapter.dart';
import 'package:practicaflutter/data/DTO/usersDTO.dart';
import 'package:practicaflutter/domain/models/user.dart';
import 'package:practicaflutter/domain/repositories/InterfaceUserInfoRepository.dart';

 class UserInfoReposotorioImpl implements InterfaceUserInfoRepository {
  Future <List<User>> InfoUsers() async {
    List <User> result;
    CollectionReference collectionReference = FirebaseFirestore.instance.collection("users");
    QuerySnapshot users = await collectionReference.get();
    List <usersDTO> usuarios = usersDTO.listMapToListDto(users.docs);
    UsuarioAdaptador user = UsuarioAdaptador();
    result = user.listDtoToListModel(usuarios);
    //toModel(usersDTO.fromMap(users.docs as Map<String, dynamic>));
    return result;
  
  }
}