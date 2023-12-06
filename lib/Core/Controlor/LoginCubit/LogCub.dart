import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1mentoracc/Core/Controlor/LoginCubit/LogSt.dart';
import 'package:task1mentoracc/Core/Manager/const.dart';
import 'package:task1mentoracc/Core/Network/remote/Dio.dart';
import 'package:task1mentoracc/Models/Usermodel.dart';

class LogCu extends Cubit<LogSt> {
  LogCu() : super(initalLogSt());
  static LogCu get(context) => BlocProvider.of(context);

  UserModel? logmodel;

  loguser({required String email, required String pass}) {
    emit(loadingCreateUser());
    DioHelperStore.postData(url: ApiConstants.loginApi, data: {
      'email': email,
      'password': pass,
    }).then((value) {
      logmodel = UserModel.fromJson(value.data);
      print(logmodel?.status);
      print(logmodel?.message);
      emit(SucessCreateUser(userModel: logmodel!));
    }).catchError((onError) {
      print(onError);
      emit(ErrorCreateUser());
    });
  }
}
