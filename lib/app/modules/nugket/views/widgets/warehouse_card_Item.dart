import 'package:fish_nugket_warehourse/app/core/values/app_theme.dart';
import 'package:fish_nugket_warehourse/app/modules/nugket/models/nugket_detail_ui_data.dart';
import 'package:flutter/material.dart';

class WarehouseCardItem extends StatelessWidget {
  final NugketDetailUiData nugketDetailUiData;

  const WarehouseCardItem({super.key, required this.nugketDetailUiData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(nugketDetailUiData.warehouseNameTh,
                style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '${nugketDetailUiData.distance.toStringAsFixed(2)} กม.',
                 style: greenTextStyle.apply(fontStyle: FontStyle.normal),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.access_time, color: Colors.green, size: 12,),
                const SizedBox(width: 2),
                Text(
                  'เปิดให้บริการ ${nugketDetailUiData.openTime} ถึง ${nugketDetailUiData.closeTime}',
                  style: greyDarkTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}