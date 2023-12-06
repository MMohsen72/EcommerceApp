import 'package:flutter/material.dart';

Widget textbutton(
    {required void Function()? onPressed, required String title, Color? co}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: co,
      ),
    ),
  );
}
