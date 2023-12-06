import 'package:task1mentoracc/Models/Usermodel.dart';

abstract class RegSt {}

class initalREGST extends RegSt {}

class SuccessRegister extends RegSt {
  final UserModel usermodel;

  SuccessRegister({required this.usermodel});
}

class LoadingRegister extends RegSt {}

class ErrorRegister extends RegSt {}

class ChooseImage extends RegSt {}
