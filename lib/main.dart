import 'package:fish_nugket_warehourse/app/binding/InitialBinding.dart';
import 'package:fish_nugket_warehourse/flavors/build_config.dart';
import 'package:fish_nugket_warehourse/flavors/env_conflig.dart';
import 'package:fish_nugket_warehourse/flavors/environment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  EnvConfig devConfig = EnvConfig(
    appName: "Flutter GetX Nugket",
    baseUrl: "https://openapi.bigc-cs.com/composite",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
