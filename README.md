# fish_nugket_warehourse

## Proposition
ชุดที่1
จง สร้างแอพหาร้านขายนักเก็ตปลาตามรายละเอียดดังต่อไปนี้
1. จง สร้างsceneที่สามารถใส่ Latitude และ Longitude และมีปุ่มเพื่อกดไปหน้าต่อไปได้
a. จง design โดยใช้ MVVM
b. จง ทําให้ช่อง Latitude, Longitude รองรับinputแค่ตัวเลขทศนิยมเท่านั้น
- ไม่ยอมให้ใส่เลยก็ได้(regx)
- ตัวอย่าง 13.715640648070432
c. ถ้ากรอกข้อมูล Latitude และ Longitude ไม่ครบจะไม่สามารถไปหน้าถัดไปได้ (ใส่ hard code text ไว้เบื้องต้นเพราะเลขที่ใช้เทสค่อยข้างยาว)
d. จง เขียนunittest
    ส่วนของเทสทำตัวอย่าง
    1. nugget_repository_test
    2. nugget_serch_controller_test
    3. warehouse_card_item_widget_test ทำหน้าที่เป็น smoke test ยังไปถึงขั้น e2e test
    4. คิดว่าถ้าจำเป็นต้อง e2e test น่าจะไปศึกษา Test Flutter Apps with Appium
2. จง สร้างsceneที่น Latitude และ Longitude จากหน้าแรกมาใช้ในการแสดงผลดังต่อไปนี้
a. จง design โดยใช้ MVVM
b. จง น Latitude และ Longitudeมาใช้ในการ request ไปยัง API ตาม cURL นี้
curl —location --request POST 'https://openapi.bigc-cs.com/composite/v2/warehouses'
\
--header 'Content-Type: application/json' \
--data '{"latitude": 13.715640648070432, "longitude": 100.58632593601942, "count": 300}’
c. จง นresponse warehousesทั้งหมดที่ได้จากการ request API มาแสดง โดยประกอบด้วย
i. ชื่อwarehouse
ii. Distance
iii. เวลาเปิดปิด
    ex.
       homeDeliveryRange: json['home_delivery_range'] == null ? 0.0 : json['home_delivery_range'].toDouble(),

4. จง วิเคราะห์ว่าจากงานที่ทํามีส่วนไหนที่สามารถปรับปรุงเพื่อเพิ่มประสิทธิภาพได้บ้าง
   - เพิ่มเติมแนะนำให้โจทย์เป็น searchView กับ listView อยู่หน้าเดียวกันเพราะจะสะดวกต่อผู้ใช้งาน และอาจจะให้ค้นด้วย keyword ชื่ิอสถานที่และ get lat,long auto search
   - ตัวอย่างยังทำไม่เสร็จอยู่ที่ branch enhance-proposition1-sub3



การเช็ค unit test coverage
<img width="1418" alt="Screen Shot 2023-10-23 at 8 34 13 AM" src="https://github.com/ladarat/nugket_warehourse/assets/12799910/117f8631-9723-43aa-8c4d-b627cd7f1580">

```
# Generate `coverage/lcov.info` file
flutter test --coverage
# Generate HTML report
# Note: on macOS you need to have lcov installed on your system (`brew install lcov`) to use this:
genhtml coverage/lcov.info -o coverage/html
# Open the report
open coverage/html/index.html
```



