import 'package:fish_nugket_warehourse/app/modules/nugget/controllers/nugget_search_controller.dart';
import 'package:fish_nugket_warehourse/app/modules/nugget/views/widgets/warehouse_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NuggetMainListView extends StatefulWidget {
  const NuggetMainListView({super.key});

  @override
  State<NuggetMainListView> createState() => _NuggetListPageState();
}

class _NuggetListPageState extends State<NuggetMainListView> {
  final nuggetSearchController = Get.put(NuggetSearchController());

  @override
  void initState() {
    super.initState();
    final locationSearch = Get.arguments;
    nuggetSearchController.fetchNugkets(locationSearch);
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
              Expanded(child: NuggetListView(nuggetSearchController)),
            ],
          ),
        ));
  }
}

class NuggetListView extends StatelessWidget {
  NuggetListView(this.nuggetSearchController);

  final NuggetSearchController nuggetSearchController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => nuggetSearchController.isLoading
          ? const SizedBox(
              height: 20,
              child: Center(
                child: Expanded(
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          : ListView.builder(
              itemCount: nuggetSearchController.nugketDetails.length,
              itemBuilder: (context, index) {
                final nugket = nuggetSearchController.nugketDetails[index];
                return WarehouseCardItem(nuggetDetailUiData: nugket);
              },
            ),
    );
  }
}
