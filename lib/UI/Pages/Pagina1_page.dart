import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicaflutter/UI/bloc/user/user_bloc.dart';
import 'package:practicaflutter/domain/models/user.dart';

class Pagina1Page extends StatelessWidget {
  Pagina1Page({Key key}) : super(key: key);
  bool acceso = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informacion Usuario'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          return state.existUser
              ? InformacionUsuario(state.user, state.loginUser, state.allUsers,
                  state.userRegister)
              : const Center(
                  child: Text('No hay usuario seleccionado'),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.accessibility_new),
          onPressed: () => Navigator.pushNamed(context, 'Pagina2')),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final User user;
  final User login;
  final List<User> allUser;
  final bool userRegister;
  InformacionUsuario(this.user, this.login, this.allUser, this.userRegister)
      : super();

  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          width: 400,
          height: 400,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('General',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Divider(),
              ListTile(title: Text('Nombre: ${user.nombre}')),
              ListTile(title: Text('Edad: ${user.edad}')),
              ListTile(title: Text('Profesion: ${user.profesion}')),
              const Divider(),
              if (login != null)
                ListTile(
                    title: Text(
                        'Usuario autenticado: ${login.nombre} ${login.apellido} ${login.profesion}')),
              const Divider(),

              if (allUser.length != 0)
                const Text('Usuarios Registrados',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Divider(),
              //desestructurar
              allUser.isNotEmpty
                  ? Container(
                      width: 400,
                      height: 400,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.all(8),
                          itemCount: allUser.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 50,
                              child: Center(
                                  child: Text(
                                      'Nombre: ${allUser[index].nombre} ${allUser[index].apellido}')),
                            );
                          }),
                    )
                  : Container()
            ],
          ),
        )
      ],
    ));
  
  }
}
