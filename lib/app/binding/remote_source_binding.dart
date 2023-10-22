import 'package:fish_nugket_warehourse/app/data/remote/nugget_remote_data_source.dart';
import 'package:fish_nugket_warehourse/app/data/remote/nugget_remote_data_source_impl.dart';
import 'package:get/get.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NuggetRemoteDataSource>(
      () => NuggetRemoteDataSourceImpl(),
      fenix: true,
      tag: (NuggetRemoteDataSource).toString(),
    );
  }
}
