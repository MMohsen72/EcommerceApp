import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1mentoracc/Core/Controlor/HomeCubit/HomeCu.dart';
import 'package:task1mentoracc/Core/Controlor/HomeCubit/HomeSt.dart';
import 'package:task1mentoracc/Models/HomeModel.dart';
import 'package:task1mentoracc/Screen/Widget/DefButton.dart';
import 'package:task1mentoracc/Screen/Widget/ProDetWidget.dart';

class ProDet extends StatelessWidget {
  Product? model;
  ProDet(this.model);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeSt>(
      listener: (context, state) {},
      builder: (context, state) {
        var cu = HomeCubit.get(context);
        return Scaffold(
          backgroundColor: Color(0xfff2f3f5),
          appBar: AppBar(
            title: Text('Product Details'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  child: ProDetShape1(context: context, modell: model!),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: proDetShape2(modell: model!),
                ),
                SizedBox(
                  height: 15,
                ),
                DefaultButton(
                  buttonWidget: Text(
                    'Add To Cart',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  function: () {},
                  backgroundColor: Colors.green,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
