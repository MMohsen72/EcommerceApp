import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:task1mentoracc/Core/Manager/list.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:task1mentoracc/Models/HomeModel.dart';
import 'package:task1mentoracc/Screen/Modules/ProDetials.dart';
import 'package:task1mentoracc/Screen/Widget/Nav.dart';

Widget sliderWidget() {
  return CarouselSlider(
    items: slider,
    options: CarouselOptions(
      autoPlay: true,
      autoPlayAnimationDuration: const Duration(seconds: 1),
      autoPlayCurve: Curves.fastOutSlowIn,
      height: 150,
      autoPlayInterval: const Duration(seconds: 3),
      viewportFraction: 1.0,
    ),
  );
}

Widget CatShape({required String text}) {
  return Container(
    width: 100,
    // height: 60,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 246, 246, 246),
      borderRadius: BorderRadius.circular(32),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Color(0xff1b81f8),
          child: Icon(
            Icons.laptop,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Center(
          child: Text(
            '$text',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildProductItem(context,
        {required Product model, void Function()? onTap}) =>
    InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 180,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadiusDirectional.only(
                      bottomEnd: Radius.circular(32),
                      topEnd: Radius.circular(32),
                      topStart: Radius.circular(20),
                    )),
                child: Text(
                  model.status!,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Expanded(
                child: Image(
                  image: NetworkImage('${model.image}'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${model.name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        '${model.company}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        children: [
                          Text('\$'),
                          Text(
                            '${model.price}',
                          ),
                          Spacer(),
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
