import 'package:fish_nugket_warehourse/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(microseconds: 2000)).then((value) => Get.toNamed(Routes.HOME));
    return const Scaffold(
      body: LinearProgressIndicator(),
    );
  }
}
