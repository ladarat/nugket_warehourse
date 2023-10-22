import 'package:fish_nugket_warehourse/app/data/model/location_request.dart';
import 'package:fish_nugket_warehourse/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NugketSearchView extends StatefulWidget {
  const NugketSearchView({super.key});

  @override
  State<NugketSearchView> createState() => _NugkeSearchPageState();
}

class _NugkeSearchPageState extends State<NugketSearchView> {
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
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'(^\d*\.?\d*)'))
                      ],
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
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'(^\d*\.?\d*)'))
                      ],
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
                          Get.toNamed(Routes.LIST, arguments: LocationRequest(
                            count: 300,
                            latitude: double.parse(latitude),
                            longitude: double.parse(longitude),
                          ).toJson(),);
                      }
                    }, // Function to call when the button is pressed
                    child: const Text('ค้นหา'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
