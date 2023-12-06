import 'package:flutter/material.dart';
import 'package:task1mentoracc/Models/OnBoardModel.dart';

Widget onboardWidget({required OnBoardModel model}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          height: 300,
          image: AssetImage('${model.img}'),
        ),
        Text(
          '${model.title}',
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Text('${model.subtitle}'),
        ),
      ],
    ),
  );
}
