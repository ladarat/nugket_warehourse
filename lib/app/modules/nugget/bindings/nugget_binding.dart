import 'package:fish_nugket_warehourse/app/modules/nugget/controllers/nugget_search_controller.dart';
import 'package:get/get.dart';

class NugketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NuggetSearchController>(
      () => NuggetSearchController(),
    );
  }
}
