import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroscreenWidget extends StatelessWidget {
  final controller;
  const IntroscreenWidget({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: controller.keyIntroScreen,
      pages: [
        PageViewModel(
          title: "Selamat Datang di aplikasi WeStay!",
          body: "Aplikasi yang memudahkan kamu",
          image: Center(child: Image.asset('asset/images/intro1.png')),
        ),
        PageViewModel(
          title: "Cari Hotel Lebih Mudah ",
          body: "Kamu Bisa Menggunakan Fitur Dibawah ",
          image: Center(child: Image.asset('asset/images/intro1.png')),
        ),
        PageViewModel(
          title: "Dapatkan Penawaran Murah ",
          body: "Manfaatkan berbgai penawaran ",
          image: Center(child: Image.asset('asset/images/intro1.png')),
        ),
        PageViewModel(
          title: "Kumpulkan Point",
          body: "Kumpulkan point dari setiap transsaksi",
          image: Center(child: Image.asset('asset/images/intro1.png')),
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
