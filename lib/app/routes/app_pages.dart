import 'package:fish_nugket_warehourse/app/modules/nugket/bindings/nugket_binding.dart';
import 'package:fish_nugket_warehourse/app/modules/nugket/views/nugket_list_view.dart';
import 'package:fish_nugket_warehourse/app/modules/splash/views/splash_view.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => NugketListView(),
      binding: NugketBinding(),
    ),
  ];
}

abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;
}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const HOME = '/home';
}
