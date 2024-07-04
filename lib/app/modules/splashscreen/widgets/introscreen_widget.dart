import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroscreenWidget extends StatelessWidget {
  final controller;
  const IntroscreenWidget({Key? key, this.controller});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: controller.keyIntroScreen,
      pages: [
        PageViewModel(
          title: "Selamat Datang di aplikasi Olive Mobile!",
          body: "",
          image: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(
                      'asset/images/intro.jpeg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
      onDone: () => controller.goToHome(),
      onSkip: () => controller.goToHome(),
      showNextButton: true,
      showDoneButton: true,
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Text("Next"),
      done: const Text("Done"),
    );
  }
}
