import 'package:task1mentoracc/Models/Usermodel.dart';

abstract class LogSt {}

class initalLogSt extends LogSt {}

class loadingCreateUser extends LogSt {}

class SucessCreateUser extends LogSt {
  final UserModel userModel;

  SucessCreateUser({required this.userModel});
}

class ErrorCreateUser extends LogSt {}
