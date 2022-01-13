part of 'user_bloc.dart';
@immutable
abstract class UserEvent{}

class ActivateUser extends UserEvent{
  final User user;
  ActivateUser(this.user);//siempre deben mandar el usuario
  
}

class LoginUser extends UserEvent{
  final String name;
  final String pass;
  LoginUser(this.name, this.pass);
  
}

class ShowUser extends UserEvent{
  ShowUser();
}
class RegisterUser extends UserEvent{
  final User userRegister;
  RegisterUser(this.userRegister);
}

class InitialUserState extends UserEvent{
  InitialUserState();
}