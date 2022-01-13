import 'package:practicaflutter/domain/models/user.dart';

abstract  class InterfaceUserInfoRepository {
  Future <List <User>> InfoUsers();
}