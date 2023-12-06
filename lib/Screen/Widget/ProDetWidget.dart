import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:task1mentoracc/Core/Controlor/HomeCubit/HomeCu.dart';
import 'package:task1mentoracc/Models/HomeModel.dart';

Widget ProDetShape1({required BuildContext context, required Product modell}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) => Image(
                image: NetworkImage(
                  modell.images![index],
                ),
              ),
              itemCount: 3,
              onPageChanged: (index) => HomeCubit.get(context).chCurr(index),
              physics: const BouncingScrollPhysics(),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: DotsIndicator(
              dotsCount: 3,
              position: HomeCubit.get(context).curr,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '${modell.name}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadiusDirectional.only(
                      topEnd: Radius.circular(20),
                      bottomEnd: Radius.circular(20),
                    ),
                  ),
                  child: const Text(
                    ' Sales',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${modell.sales} Sales',
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text(
                  '\$${modell.price}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  '18% off',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget proDetShape2({required Product modell}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Details',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const Text(
                'Company',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Text('${modell.company}'),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const Text(
                'Status',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Text('${modell.status}'),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const Text(
                'Name',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Text('${modell.name}'),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const Text(
                'Description',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Container(
                width: 224,
                child: Text(
                  '${modell.description}',
                  maxLines: 2,
                  softWrap: true,
                  textWidthBasis: TextWidthBasis.parent,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
