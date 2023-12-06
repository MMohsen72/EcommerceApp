import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task1mentoracc/Core/Controlor/RegisterCubit/RegSt.dart';
import 'package:task1mentoracc/Core/Manager/const.dart';
import 'package:task1mentoracc/Core/Network/remote/Dio.dart';
import 'package:task1mentoracc/Models/Usermodel.dart';

class RegCubit extends Cubit<RegSt> {
  RegCubit() : super(initalREGST());
  static RegCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;
  creatuser({
    required name,
    required email,
    required phone,
    required pass,
    required nationalId,
  }) {
    emit(LoadingRegister());
    DioHelperStore.postData(url: ApiConstants.registerApi, data: {
      'name': name,
      'email': email,
      'phone': phone,
      'nationalId': nationalId,
      'gender': 'male',
      'password': pass,
      'token': '111',
      'profileImage': userImage,
    }).then((value) {
      userModel = UserModel.fromJson(value.data);
      print('Done');

      emit(SuccessRegister(usermodel: userModel!));
    }).catchError((onError) {
      print('Erorr is');
      print(onError);
      emit(ErrorRegister());
    });
  }

  ImagePicker picker = ImagePicker();
  File? image;
  Uint8List? bytes;
  String? userImage;
  Future<void> addImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      bytes = File(image!.path).readAsBytesSync();
      userImage = base64Encode(bytes!);
      print('images = $userImage');
      emit(ChooseImage());
    } else {
      print('no image selected');
    }
  }
}
