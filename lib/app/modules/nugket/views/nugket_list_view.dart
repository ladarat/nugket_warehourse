import 'package:fish_nugket_warehourse/app/modules/nugket/controllers/nugket_search_controller.dart';
import 'package:fish_nugket_warehourse/app/modules/nugket/views/widgets/warehouse_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NugketListView extends StatefulWidget {
  const NugketListView({super.key});

  @override
  State<NugketListView> createState() => _NugketListPageState();
}

class _NugketListPageState extends State<NugketListView> {
  final nugketSearchController = Get.put(NugketSearchController());

  @override
  void initState() {
    super.initState();
    final locationSearch = Get.arguments;
    nugketSearchController.fetchNugkets(locationSearch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nugget MVVM with GetX and Dio'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(48),
          child: Column(
            children: [
              Expanded(child: NugKetListView(nugketSearchController)),
            ],
          ),
        ));
  }
}

class NugKetListView extends StatelessWidget {
  const NugKetListView(this.nugketSearchController);

  final NugketSearchController nugketSearchController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => nugketSearchController.isLoading
          ? const SizedBox(
              height: 20,
              child: Center(
                child: Expanded(
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          : ListView.builder(
              itemCount: nugketSearchController.nugketDetails.length,
              itemBuilder: (context, index) {
                final nugket = nugketSearchController.nugketDetails[index];
                return WarehouseCardItem(nugketDetailUiData: nugket);
              },
            ),
    );
  }
}
