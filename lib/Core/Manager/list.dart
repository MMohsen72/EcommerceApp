import 'package:flutter/material.dart';
import 'package:task1mentoracc/Core/Manager/images.dart';
import 'package:task1mentoracc/Models/OnBoardModel.dart';

List<OnBoardModel> boardList = [
  OnBoardModel(
    'Search',
    'Search About Laptop..',
    boardimage(img: '8.png'),
  ),
  OnBoardModel(
    'Order',
    'Order it..',
    boardimage(img: '6.jpg'),
  ),
  OnBoardModel(
    'Feel Happy',
    'Feel Happy with Games and other features..',
    boardimage(img: '5.jpg'),
  ),
];

List<Widget> slider = [
  const Image(
    image: AssetImage('image/20.jpg'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('image/21.jpg'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
  const Image(
    image: AssetImage('image/23.jpg'),
    fit: BoxFit.cover,
    width: double.infinity,
  ),
];

List<String> comp = ['Hp', 'Dell', 'Apple', 'Lenovo'];
