import 'package:fish_nugket_warehourse/app/modules/nugket/bindings/nugket_binding.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    NugketBinding().dependencies();
  }
}
