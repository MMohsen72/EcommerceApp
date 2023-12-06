import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1mentoracc/Core/Controlor/OnboardCubit/onBoardSt.dart';
import 'package:task1mentoracc/Core/Manager/list.dart';

class onBoardCubit extends Cubit<onBoardST> {
  onBoardCubit() : super(initalOnBoST());
  static onBoardCubit get(context) => BlocProvider.of(context);

  bool islast = false;
  int cur = 0;
  islastfun(int index) {
    if (index == boardList.length - 1) {
      islast = true;
    } else {
      islast = false;
    }
    cur = index;
    emit(islastST());
  }
}
