import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1mentoracc/Core/Controlor/RegisterCubit/RegCubit.dart';
import 'package:task1mentoracc/Core/Controlor/RegisterCubit/RegSt.dart';
import 'package:task1mentoracc/Core/Manager/const.dart';
import 'package:task1mentoracc/Core/Network/local/CachHelper.dart';
import 'package:task1mentoracc/Core/Network/remote/Dio.dart';
import 'package:task1mentoracc/Screen/Modules/Home.dart';
import 'package:task1mentoracc/Screen/Modules/LoginScreen.dart';
import 'package:task1mentoracc/Screen/Widget/DefButton.dart';
import 'package:task1mentoracc/Screen/Widget/Nav.dart';
import 'package:task1mentoracc/Screen/Widget/Showtoast.dart';
import 'package:task1mentoracc/Screen/Widget/deftextform.dart';
import 'package:task1mentoracc/Screen/Widget/textButton.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var email = TextEditingController();
    var pass = TextEditingController();
    var phone = TextEditingController();
    var user = TextEditingController();
    var id = TextEditingController();

    var formkey = GlobalKey<FormState>();

    return BlocConsumer<RegCubit, RegSt>(
      listener: (context, state) {
        if (state is SuccessRegister) {
          if (state.usermodel.status == 'success') {
            toast(msg: state.usermodel.message!, color: Colors.green);

            CacheHelper.saveData(
                    key: 'Id', value: state.usermodel.user?.nationalId)
                .then((value) {
              ntid = state.usermodel.user?.nationalId;
            });

            CacheHelper.saveData(
                    key: 'Token', value: state.usermodel.user?.token)
                .then((value) {
              token = state.usermodel.user?.token;
              navigateAndFinishThisScreen(context, Home());
            });
          } else {
            toast(msg: state.usermodel.message!, color: Colors.red);

            print(state.usermodel.message);
          }
        } else if (state is ErrorRegister) {
          print('Errrrrrorrrr ');
        }
      },
      builder: (context, state) {
        var cu = RegCubit.get(context);
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
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'Create an Account',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, bottom: 30, top: 10),
                        child: cu.image == null
                            ? MaterialButton(
                                onPressed: () {
                                  cu.addImage();
                                },
                                child: CircleAvatar(
                                    radius: 40,
                                    child: ClipOval(
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                'https://www.bing.com/th?id=OIP.UL-1DMfhVszKjcYlgEespAD0D_&w=159&h=185&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )))
                            : CircleAvatar(
                                radius: 40,
                                child: ClipOval(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: FileImage(cu.image!),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ),
                      // const SizedBox(
                      //   height: 30,
                      // ),
                      DefaultFieldForm(
                        controller: user,
                        keyboard: TextInputType.text,
                        valid: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Name';
                          }
                          return null;
                        },
                        label: 'Username',
                        prefix: Icons.person_outline,
                      ),
                      const SizedBox(
                        height: 10,
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
                        height: 10,
                      ),
                      DefaultFieldForm(
                        controller: phone,
                        keyboard: TextInputType.phone,
                        valid: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Phone';
                          }
                          return null;
                        },
                        label: 'Phone',
                        prefix: Icons.phone_outlined,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DefaultFieldForm(
                        controller: id,
                        keyboard: TextInputType.phone,
                        valid: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your ID';
                          }
                          return null;
                        },
                        label: 'Id',
                        prefix: Icons.insert_drive_file_outlined,
                      ),
                      const SizedBox(
                        height: 10,
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
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        function: () {
                          if (formkey.currentState!.validate()) {
                            cu.creatuser(
                              name: user.text,
                              email: email.text,
                              phone: phone.text,
                              pass: pass.text,
                              nationalId: id.text,
                            );
                          }
                        },
                        backgroundColor: const Color(0xff371969),
                        width: 200,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already Have An Account?',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          textbutton(
                              onPressed: () {
                                navigateToNextScreen(
                                    context, const LoginScreen());
                              },
                              title: 'Login'),
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
