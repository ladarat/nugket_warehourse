import 'package:fish_nugket_warehourse/app/data/repository/nugket_repository.dart';
import 'package:fish_nugket_warehourse/app/data/repository/nugket_repository_impl.dart';
import 'package:get/get.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NugketRepository>(
      () => NugketRepositoryImpl(),
      tag: (NugketRepository).toString(),
    );
  }
}