import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicaflutter/UI/bloc/user/user_bloc.dart';
import 'package:practicaflutter/domain/models/user.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String nombre, apellido, profesion, contrasena;
  int edad;

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Formulario de registro'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: "Nombre:"),
                      onSaved: (value) {
                        nombre = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Digite la informacion";
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Apellido"),
                      onSaved: (value) {
                        apellido = value;
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Digite la informacion";
                        }
                      },
                    ),
                    TextFormField(
                        decoration: InputDecoration(labelText: "Edad"),
                        onSaved: (value) {
                          edad = int.parse(value);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Digite la informacion";
                          }
                        }),
                    TextFormField(
                        decoration: InputDecoration(labelText: "Profesion"),
                        onSaved: (value) {
                          profesion = (value);
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Digite la informacion";
                          }
                        }),
                    TextFormField(
                        decoration: InputDecoration(labelText: "Contraseña"),
                        onSaved: (value) {
                          contrasena = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Digite la informacion";
                          }
                        },
                        obscureText: true),
                    RaisedButton(
                      child: Text("Registrarme"),
                      onPressed: () {
                        _sendInfo(context);
                      },
                    )
                  ],
                ),
              ),
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (_, state) {
                return state.userRegister
                    ? registrarUsuario(state.userRegister)
                    : const Center(
                        child: Text(''),
                      );
              },
            ),
          ],
        )
      )
    );
  }
  void _sendInfo(BuildContext context) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      User newUser = User(nombre, apellido, edad, profesion, contrasena);
      BlocProvider.of<UserBloc>(context, listen: false)
          .add(RegisterUser(newUser));
    }
    formKey.currentState.reset();
  }
}

class registrarUsuario extends StatelessWidget {
  final bool userRegister;
  registrarUsuario(this.userRegister) : super();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (userRegister)
            AlertDialog(
            title: Text("Mensaje"),
            content: Text("Usuario Registrado"),
            actions: <Widget>[
              ElevatedButton(
                child: Text(
                  "CERRAR",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  BlocProvider.of<UserBloc>(context, listen: false).add(InitialUserState());
                },
              )
            ],
          )
        ],
      ),
    ); 
  }  
}
