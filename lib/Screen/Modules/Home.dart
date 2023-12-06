import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1mentoracc/Core/Controlor/HomeCubit/HomeCu.dart';
import 'package:task1mentoracc/Core/Controlor/HomeCubit/HomeSt.dart';
import 'package:task1mentoracc/Core/Manager/list.dart';
import 'package:task1mentoracc/Screen/Modules/ProDetials.dart';
import 'package:task1mentoracc/Screen/Widget/Nav.dart';
import 'package:task1mentoracc/Screen/Widget/ProductWidget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      backgroundColor: Color(0xfff2f3f5),
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              EvaIcons.searchOutline,
            ),
          ),
        ],
      ),
      body: BlocConsumer<HomeCubit, HomeSt>(
        listener: (context, state) {},
        builder: (context, state) {
          var cu = HomeCubit.get(context);
          if (cu.labmodel == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sliderWidget(),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Companies',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.separated(
                        itemBuilder: (context, index) =>
                            CatShape(text: comp[index]),
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 10),
                        // shrinkWrap: true,
                        itemCount: comp.length,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GridView.count(
                      childAspectRatio: 1 / 1.3,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: List.generate(
                        cu.labmodel!.product!.length,
                        (index) => buildProductItem(context,
                            model: cu.labmodel!.product![index], onTap: () {
                          navigateToNextScreen(
                            context,
                            ProDet(
                              cu.labmodel!.product![index],
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
