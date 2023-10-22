import 'package:fish_nugket_warehourse/app/data/model/location_request.dart';
import 'package:fish_nugket_warehourse/app/modules/nugket/controllers/nugket_search_controller.dart';
import 'package:fish_nugket_warehourse/app/modules/nugket/models/nugket_detail_ui_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NugketListView extends StatefulWidget {
  const NugketListView({super.key});

  @override
  State<NugketListView> createState() => _NugketListPageState();
}

class _NugketListPageState extends State<NugketListView> {
  final nugketSearchController = Get.put(NugketSearchController());
  final latitudeController = TextEditingController(text: '13.715640648070432');
  final longitudeController = TextEditingController(text: '100.58632593601942');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nugket MVVM with GetX and Dio'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(48),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))],
                      controller: latitudeController,
                      decoration: const InputDecoration(
                        labelText: "Latitude",
                        hintText: "13.71000000",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))],
                      controller: longitudeController,
                      decoration: const InputDecoration(
                        labelText: "Latitude",
                        hintText: "13.71000000",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      final latitude = latitudeController.text;
                      final longitude = longitudeController.text;
                      if (latitude.isNotEmpty && longitude.isNotEmpty) {
                        nugketSearchController.fetchNugkets(
                          LocationRequest(
                            count: 300,
                            latitude: double.parse(latitude),
                            longitude: double.parse(longitude),
                          ),
                        );
                      }
                    }, // Function to call when the button is pressed
                    child: const Text('ค้นหา'),
                  ),
                ],
              ),
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
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemCount: nugketSearchController.nugketDetails.length,
              itemBuilder: (context, index) {
                final nugket = nugketSearchController.nugketDetails[index];
                return CadItem(nugketDetailUiData: nugket);
              },
            ),
    );
  }
}

class CadItem extends StatelessWidget {
  final NugketDetailUiData nugketDetailUiData;

  const CadItem({super.key, required this.nugketDetailUiData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 42),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(nugketDetailUiData.warehouseNameTh, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '${nugketDetailUiData.distance.toStringAsFixed(2)} กม.',
                  style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.access_time, color: Colors.green),
                const SizedBox(width: 16),
                Text(
                  'เปิดให้บริการ ${nugketDetailUiData.openTime} ถึง ${nugketDetailUiData.closeTime}',
                  style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
