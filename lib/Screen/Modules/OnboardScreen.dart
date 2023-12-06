import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1mentoracc/Core/Controlor/OnboardCubit/onBoardCu.dart';
import 'package:task1mentoracc/Core/Controlor/OnboardCubit/onBoardSt.dart';
import 'package:task1mentoracc/Core/Manager/list.dart';
import 'package:task1mentoracc/Core/Network/local/CachHelper.dart';
import 'package:task1mentoracc/Screen/Modules/Register.dart';
import 'package:task1mentoracc/Screen/Widget/Nav.dart';
import 'package:task1mentoracc/Screen/Widget/OnBoardWidget.dart';
import 'package:task1mentoracc/Screen/Widget/textButton.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    var pagecont = PageController();
    return BlocConsumer<onBoardCubit, onBoardST>(
      listener: (context, index) {},
      builder: (context, index) {
        var cu = onBoardCubit.get(context);
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (index) {
                    cu.islastfun(index);
                  },
                  itemBuilder: (context, index) =>
                      onboardWidget(model: boardList[index]),
                  controller: pagecont,
                  itemCount: boardList.length,
                  physics: const BouncingScrollPhysics(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    if (cu.islast == false)
                      Expanded(
                        child: textbutton(
                            onPressed: () {
                              CacheHelper.putBoolData(
                                  key: 'Board', value: true);
                              navigateAndFinishThisScreen(
                                  context, const RegisterScreen());
                            },
                            title: 'Skip'),
                      )
                    else
                      const Expanded(
                        child: Text(''),
                      ),
                    Expanded(
                      child: DotsIndicator(
                        dotsCount: 3,
                        axis: Axis.horizontal,
                        decorator: const DotsDecorator(),
                        position: cu.cur,
                      ),
                    ),
                    cu.islast == false
                        ? Expanded(
                            child: textbutton(
                                onPressed: () {
                                  pagecont.nextPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut);
                                },
                                title: 'Next'),
                          )
                        : Expanded(
                            child: textbutton(
                                onPressed: () {
                                  CacheHelper.putBoolData(
                                      key: 'Board', value: true);
                                  navigateAndFinishThisScreen(
                                      context, const RegisterScreen());
                                },
                                title: 'Got it'),
                          ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
