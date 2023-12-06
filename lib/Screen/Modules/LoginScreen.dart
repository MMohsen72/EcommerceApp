import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1mentoracc/Core/Controlor/LoginCubit/LogCub.dart';
import 'package:task1mentoracc/Core/Controlor/LoginCubit/LogSt.dart';
import 'package:task1mentoracc/Core/Manager/const.dart';
import 'package:task1mentoracc/Core/Network/local/CachHelper.dart';
import 'package:task1mentoracc/Screen/Modules/Home.dart';
import 'package:task1mentoracc/Screen/Modules/Register.dart';
import 'package:task1mentoracc/Screen/Widget/DefButton.dart';
import 'package:task1mentoracc/Screen/Widget/Nav.dart';
import 'package:task1mentoracc/Screen/Widget/Showtoast.dart';
import 'package:task1mentoracc/Screen/Widget/deftextform.dart';
import 'package:task1mentoracc/Screen/Widget/textButton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var email = TextEditingController();
    var pass = TextEditingController();
    var formkey = GlobalKey<FormState>();

    return BlocConsumer<LogCu, LogSt>(
      listener: (context, state) {
        if (state is SucessCreateUser) {
          if (state.userModel.status == 'success') {
            toast(msg: state.userModel.message!, color: Colors.green);
            CacheHelper.saveData(
                    key: 'Id', value: state.userModel.user?.nationalId)
                .then((value) {
              ntid = state.userModel.user?.nationalId;
            });

            CacheHelper.saveData(
                    key: 'Token', value: state.userModel.user?.token)
                .then((value) {
              token = state.userModel.user?.token;
              navigateAndFinishThisScreen(context, Home());
            });
          } else {
            toast(msg: state.userModel.message!, color: Colors.red);

            print(state.userModel.message);
          }
        } else if (state is ErrorCreateUser) {
          print('Errrrrrorrrr ');
        }
      },
      builder: (context, state) {
        var cu = LogCu.get(context);
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'Welcome Back..',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultFieldForm(
                        controller: email,
                        keyboard: TextInputType.emailAddress,
                        valid: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Email';
                          }
                          return null;
                        },
                        label: 'Email',
                        prefix: Icons.email_outlined,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      DefaultFieldForm(
                        controller: pass,
                        keyboard: TextInputType.visiblePassword,
                        show: true,
                        valid: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Password';
                          }
                          return null;
                        },
                        label: 'Password',
                        prefix: Icons.lock_outline,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      DefaultButton(
                        buttonWidget: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        function: () {
                          if (formkey.currentState!.validate()) {
                            cu.loguser(email: email.text, pass: pass.text);
                          }
                        },
                        backgroundColor: const Color(0xff142453),
                        width: 200,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          textbutton(
                            onPressed: () {
                              navigateToNextScreen(
                                  context, const RegisterScreen());
                            },
                            title: 'SignUp Now',
                            co: const Color.fromARGB(255, 34, 58, 131),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
