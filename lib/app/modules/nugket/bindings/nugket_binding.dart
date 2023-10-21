import 'package:fish_nugket_warehourse/app/modules/nugket/controllers/nugket_search_controller.dart';
import 'package:get/get.dart';

class NugketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NugketSearchController>(
      () => NugketSearchController(),
    );
  }
}