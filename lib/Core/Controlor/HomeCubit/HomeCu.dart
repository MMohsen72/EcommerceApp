import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1mentoracc/Core/Controlor/HomeCubit/HomeSt.dart';
import 'package:task1mentoracc/Core/Manager/const.dart';
import 'package:task1mentoracc/Core/Network/remote/Dio.dart';
import 'package:task1mentoracc/Models/HomeModel.dart';

class HomeCubit extends Cubit<HomeSt> {
  HomeCubit() : super(initalHome());
  static HomeCubit get(context) => BlocProvider.of(context);
  LaptopsModel? labmodel;
  getData() {
    DioHelperStore.getData(url: ApiConstants.homeApi).then((value) {
      labmodel = LaptopsModel.fromJson(value.data);
      print(value.data);
      emit(SuccessData());
    }).catchError((onError) {
      print(onError);
      emit(ErrorData());
    });
  }

  int curr = 0;
  chCurr(int index) {
    curr = index;
    emit(SuccessChange());
  }
}
