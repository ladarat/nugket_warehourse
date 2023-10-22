import 'package:fish_nugket_warehourse/app/modules/nugket/views/widgets/warehouse_card_Item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fish_nugket_warehourse/app/modules/nugket/models/nugket_detail_ui_data.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('WarehouseCardItem should render correctly', (WidgetTester tester) async {
    // Create a NugketDetailUiData instance for testing
    final nugketDetailUiData = NugketDetailUiData(
      warehouseNameTh: 'นักเกทปลา เอกมัย อิอิ',
      distance: 5.0,
      openTime: '09:00',
      closeTime: '15:00', 
      warehouseNameEn: 'Nugget Ekamai eiei',
    );

    // Build the widget
    await tester.pumpWidget(GetMaterialApp(
      home: WarehouseCardItem(nugketDetailUiData: nugketDetailUiData),
    ));

    // Verify that the text is displayed correctly
    expect(find.text('นักเกทปลา เอกมัย อิอิ'), findsOneWidget);
    expect(find.text('5.00 กม.'), findsOneWidget);
    expect(find.text('เปิดให้บริการ 09:00 ถึง 15:00'), findsOneWidget);
  });
}
