import 'package:fish_nugket_warehourse/app/modules/nugget/bindings/nugget_binding.dart';
import 'package:fish_nugket_warehourse/app/modules/nugget/views/nugget_list_view.dart';
import 'package:fish_nugket_warehourse/app/modules/nugget/views/nugget_search_view.dart';
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
      page: () => NuggetSearchView(),
      binding: NugketBinding(),
    ),
    GetPage(
      name: _Paths.LIST,
      page: () => NuggetMainListView(),
      binding: NugketBinding(),
    ),
  ];
}

abstract class Routes {
  Routes._();

  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;
  static const LIST = _Paths.LIST;
}

abstract class _Paths {
  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const LIST = '/list';
}
