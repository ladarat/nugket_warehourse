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
    var widthScreenSize = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nugket MVVM with GetX and Dio'),
        ),
        body: Padding(
          padding: EdgeInsets.all(widthScreenSize * 0.04),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: widthScreenSize / 3,
                    child: TextFormField(
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))],
                      style: const TextStyle(fontSize: 14),
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
                  SizedBox(width: widthScreenSize * 0.04),
                  SizedBox(
                    width: widthScreenSize / 3,
                    child: TextFormField(
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)'))],
                      style: const TextStyle(fontSize: 14),
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
                  SizedBox(width: widthScreenSize * 0.04),
                  ElevatedButton(
                    onPressed: () {
                      final latitude = latitudeController.text;
                      final longitude = longitudeController.text;
                      if (latitude.isNotEmpty && longitude.isNotEmpty) {
                        Get.toNamed(
                          Routes.LIST,
                          arguments: LocationRequest(
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
            ],
          ),
        ));
  }
}