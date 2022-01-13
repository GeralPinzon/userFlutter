part of 'user_bloc.dart';


class UserState extends Equatable{
  final bool existUser;
  final User user;
  final User loginUser;
  final List<User> allUsers;
  final bool userRegister;

  UserState({this.existUser = false, this.user , this.loginUser, this.allUsers= const [], this.userRegister=false});

  @override
  List<Object> get props => [existUser, user, loginUser, allUsers, userRegister];

  UserState copyWith({
    bool existUser,
    User user,
    User loginUser,
    List<User> allUsers,
    bool userRegister,
  }) {
    return UserState(
      existUser: existUser ?? this.existUser,
      user: user ?? this.user,
      loginUser: loginUser ?? this.loginUser,
      allUsers: allUsers ?? this.allUsers,
      userRegister: userRegister ?? this.userRegister,
    );
  }
}

class UserInitialState extends UserState{//estado inicial
  UserInitialState() : super(existUser: false, user: null);

}

class UserSetState extends UserState{
  final User newUser;
  UserSetState(this.newUser) 
  : super(existUser: true, user:newUser);

}
