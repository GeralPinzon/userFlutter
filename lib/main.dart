import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicaflutter/UI/Pages/Pagina3_page.dart';
import 'package:practicaflutter/UI/bloc/user/user_bloc.dart';

import 'UI/Pages/Pagina1_page.dart';
import 'UI/Pages/Pagina2_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value){
    runApp(MyApp());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [//inicializar primera instancia y unica de nuestro blog
        BlocProvider(
          create: (context) => UserBloc(),//crea instancia y la coloca en el context 
        ),
      ],child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material app',
        initialRoute: 'Pagina1',
        routes: {
          'Pagina1': (_) =>  Pagina1Page(),
          'Pagina2': (_) => const Pagina2Page(),
          'Pagina3': (_) =>  RegisterPage(),
        },
      ),
    );
  }
}


