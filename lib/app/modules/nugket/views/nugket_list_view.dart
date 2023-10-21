import 'package:fish_nugket_warehourse/app/modules/nugket/controllers/nugket_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class NugketListView extends StatefulWidget {
  NugketListView({super.key});

  @override
  State<NugketListView> createState() => _NugketListPageState();
}

class _NugketListPageState extends State<NugketListView> {
  final nugketSearchController = Get.put(NugketSearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nugket MVVM with GetX and Dio'),
      ),
      body: Center(
        child: Obx(
          () => nugketSearchController.isLoading
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: nugketSearchController.nugketDetails.length,
                  itemBuilder: (context, index) {
                    final nugket = nugketSearchController.nugketDetails[index];
                    return ListTile(
                      title: Text(nugket.warehouseNameEn),
                      subtitle: Text(nugket.distance.toString()),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
