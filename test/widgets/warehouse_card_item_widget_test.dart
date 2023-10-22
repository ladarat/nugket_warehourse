import 'package:fish_nugket_warehourse/app/modules/nugget/views/widgets/warehouse_card_Item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fish_nugket_warehourse/app/modules/nugget/models/nugget_detail_ui_data.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('WarehouseCardItem should render correctly', (WidgetTester tester) async {
    final nuggetDetailUiData = NuggetDetailUiData(
      warehouseNameTh: 'นักเกทปลา เอกมัย อิอิ',
      distance: 5.0,
      openTime: '09:00',
      closeTime: '15:00', 
      warehouseNameEn: 'Nugget Ekamai eiei',
    );

    await tester.pumpWidget(GetMaterialApp(
      home: WarehouseCardItem(nuggetDetailUiData: nuggetDetailUiData),
    ));

    expect(find.text('นักเกทปลา เอกมัย อิอิ'), findsOneWidget);
    expect(find.text('5.00 กม.'), findsOneWidget);
    expect(find.text('เปิดให้บริการ 09:00 ถึง 15:00'), findsOneWidget);
  });
}
