import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicaflutter/UI/bloc/user/user_bloc.dart';
import 'package:practicaflutter/domain/models/user.dart';


class Pagina2Page extends StatelessWidget {
  
  const Pagina2Page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String user = 'Ana';
    final String pass = 'ana123';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              child: const Text('Establecer Usuario', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {//obtener instancia del bloc - add añade evento
                final newUser = User(
                  'Arnold','Herrera',24,
                  'Developer',
                  'arnold123',
                ); 
                BlocProvider.of<UserBloc>(context, listen: false).add(ActivateUser(newUser));
              }
            ),

            MaterialButton(
              child: const Text('Iniciar sesion', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                BlocProvider.of<UserBloc>(context, listen: false).add(LoginUser(user,pass));
              }
            ),

            MaterialButton(
              child: const Text('Mostrar usuarios', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () {
                BlocProvider.of<UserBloc>(context, listen: false).add(ShowUser());
              }
            ),
            MaterialButton(
              child: const Text('Registrar Usuario', style: TextStyle( color: Colors.white ) ),
              color: Colors.blue,
              onPressed: () => Navigator.pushNamed(context, 'Pagina3')
            ),
          ],
        )
     ),
   );
  }
}