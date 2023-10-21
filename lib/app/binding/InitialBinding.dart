import 'package:fish_nugket_warehourse/app/binding/remote_source_binding.dart';
import 'package:fish_nugket_warehourse/app/binding/repository_binding.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    RepositoryBindings().dependencies();
    RemoteSourceBindings().dependencies();
  }
}
