import 'package:fish_nugket_warehourse/app/data/remote/nugket_remote_data_source.dart';
import 'package:fish_nugket_warehourse/app/data/remote/nugket_remote_data_source_impl.dart';
import 'package:get/get.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NugketRemoteDataSource>(
      () => NugketRemoteDataSourceImpl(),
      fenix: true,
      tag: (NugketRemoteDataSource).toString(),
    );
  }
}