import 'package:fish_nugket_warehourse/app/data/repository/nugget_repository.dart';
import 'package:fish_nugket_warehourse/app/data/repository/nugget_repository_impl.dart';
import 'package:get/get.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NuggetRepository>(
      () => NugketRepositoryImpl(),
      fenix: true,
      tag: (NuggetRepository).toString(),
    );
  }
}
