import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:practicaflutter/data/Adapters/modelAdapters.dart';
import 'package:practicaflutter/data/Adapters/userAdapter.dart';
import 'package:practicaflutter/data/DTO/usersDTO.dart';
import 'package:practicaflutter/domain/models/user.dart';
import 'package:practicaflutter/domain/repositories/InterfaceUserRepository.dart';

class UsuarioReposotorioImpl implements InterfaceUserRepository {
  @override
  Future<User> login(String nombreUsuario, String contrasena) async {
    User userLogin ;
    CollectionReference collectionReference = FirebaseFirestore.instance.collection("users");
    QuerySnapshot users = await collectionReference.where("nombre", isEqualTo: nombreUsuario).get();
    if(users.docs.length != 0){
      UsuarioAdaptador usuario = UsuarioAdaptador();
      userLogin = usuario.toModel(usersDTO.fromMap(users.docs.first.data()));
    }
   return userLogin;
  
  }

  Future <bool> register(User newUser) async{
    bool register = false;
    UsuarioAdaptador userNew = UsuarioAdaptador();
    usersDTO userRegister = userNew.fromModel(newUser);
    FirebaseFirestore.instance.collection("users").add(userRegister.toMap());
    QuerySnapshot users = await FirebaseFirestore.instance.collection("users").where( "contrasena",isEqualTo: userRegister.contrasena).get();
    if(users.docs.length != 0){
      register=true;
    }    
    print(register);
    return register;
  }
}