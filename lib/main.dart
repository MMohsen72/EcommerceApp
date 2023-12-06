import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1mentoracc/Core/Controlor/HomeCubit/HomeCu.dart';
import 'package:task1mentoracc/Core/Controlor/LoginCubit/LogCub.dart';
import 'package:task1mentoracc/Core/Controlor/OnboardCubit/onBoardCu.dart';
import 'package:task1mentoracc/Core/Controlor/RegisterCubit/RegCubit.dart';
import 'package:task1mentoracc/Core/Manager/BlocObserver.dart';
import 'package:task1mentoracc/Core/Manager/const.dart';
import 'package:task1mentoracc/Core/Network/local/CachHelper.dart';
import 'package:task1mentoracc/Core/Network/remote/Dio.dart';
import 'package:task1mentoracc/Core/Theme/lightTheme.dart';
import 'package:task1mentoracc/Screen/Modules/Home.dart';
import 'package:task1mentoracc/Screen/Modules/LoginScreen.dart';
import 'package:task1mentoracc/Screen/Modules/OnboardScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelperStore.init();
  await CacheHelper.init();

  boardbool = CacheHelper.getData(key: 'Board');
  ntid = CacheHelper.getData(key: 'Id');
  token = CacheHelper.getData(key: 'Token');
  print(ntid);
  print(boardbool);
  print(token);

  if (boardbool != null) {
    if (token != null) {
      widget = Home();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnBoard();
  }
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => onBoardCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => RegCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => LogCu(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => HomeCubit()..getData(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: widget,
        theme: lightTheme,
      ),
    );
  }
}
