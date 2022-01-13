import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicaflutter/data/Implement/UserInfoRepositoryImplement.dart';
import 'package:practicaflutter/data/Implement/UserRepositoryImplement.dart';
import 'package:practicaflutter/domain/models/user.dart';
import 'package:practicaflutter/domain/repositories/InterfaceUserInfoRepository.dart';
import 'package:practicaflutter/domain/repositories/InterfaceUserRepository.dart';


part 'user_event.dart';//permite trabajar los 3 archivos como si fuera uno solo 
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  InterfaceUserRepository repo = UsuarioReposotorioImpl();
  InterfaceUserInfoRepository repo2 = UserInfoReposotorioImpl();
  UserBloc() : super( UserInitialState() ){//estado inicial del blog
    on<ActivateUser>((event, emit) {
      emit(state.copyWith(user:event.user, existUser: true));
    });//si recibo accion de activar usuario/emit para emitir un nuevo estado
  
    on<LoginUser>((event, emit) async{
      User usuario;
      if(!state.existUser) return ;
      usuario = await repo.login(event.name, event.pass);
      emit(state.copyWith(loginUser: usuario));
    });

    on<ShowUser>((event,emit) async{
      List <User> allUsers;
      allUsers = await repo2.InfoUsers();
      emit(state.copyWith(allUsers: allUsers));
    });

    on<RegisterUser>((event,emit) async{
      bool userRegister;
      userRegister = await repo.register(event.userRegister);
      emit(state.copyWith(userRegister: userRegister));
    });
     on<InitialUserState>((event,emit) async{
      emit(state.copyWith(userRegister: false));
     });
  }
}