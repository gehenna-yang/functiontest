

import 'dart:convert';
import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column;
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:testfun_project/Excel/data_excel.dart';

class CreateExcelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CreateExcelStatefulWidget(title: '6. Excel Test'),
    );
  }
}

/// Represents the XlsIO stateful widget class.
class CreateExcelStatefulWidget extends StatefulWidget {
  /// Initalize the instance of the [CreateExcelStatefulWidget] class.
  const CreateExcelStatefulWidget({Key? key, required this.title})
      : super(key: key);

  /// title.
  final String title;
  @override
  // ignore: library_private_types_in_public_api
  _CreateExcelState createState() => _CreateExcelState();
}

class _CreateExcelState extends State<CreateExcelStatefulWidget> {

  var excel;

  List<String> sheetname_list = [];
  List<int> rows_list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                // backgroundColor: Colors.white,
                backgroundColor: Colors.lightBlue,
              ),
              onPressed: generateExcel,
              child: const Text('Generate Excel', style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }

  Future<void> readExcel() async {
    try {
      Directory? directory = await getExternalStorageDirectory();
      debugPrint('directory : $directory/${directory!.path}');

      File pathfile = File(('${directory.path}/output_excel_test.xlsx'));

      ByteData data = await rootBundle.load('${directory.path}/output_excel_test.xlsx');
      print("file ? ${data.toString()}");
      var bytes1 = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      excel = Excel.decodeBytes(bytes1);

      List<Data>? list = [];
      for (var table in excel.tables.keys) {
        print(table); //sheet Name
        print(excel.tables[table]!.maxCols); // 가로 갯수
        print(excel.tables[table]!.maxRows); // 세로 갯수
        // for (var row in excel.tables[table]!.rows) {
        //   print("$row"); // 가로에 나열된 값(리스트 형태)
        // }
        for (int i = 0; i<excel.tables[table]!.rows.length; i++) {
          // list.addAll(excel.tables[table]!.row(i));

          for(int j = 0; j<excel.tables[table]!.row(i).length; j++){
            // print("??? ${excel.tables[table]!.row(i)}\n${excel.tables[table]!.row(i)[j]?.value}");
            print("??? ${excel.tables[table]!.row(i)[j]?.value}");
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> generateExcel() async {
    //Create a Excel document.
    Directory? directory = await getExternalStorageDirectory();
    debugPrint('directory : $directory/${directory!.path}');

    //Creating a workbook.
    final Workbook workbook = Workbook();
    //Accessing via index
    final Worksheet sheet = workbook.worksheets[0];
    sheet.showGridlines = true;
    sheet.name = "Testsheet";

    // Enable calculation for worksheet.
    sheet.enableSheetCalculations();
    //Set data in the worksheet.
    sheet.getRangeByName('A1').columnWidth = 5;
    sheet.getRangeByName('B1').columnWidth = 15;
    sheet.getRangeByName('C1').columnWidth = 15;
    sheet.getRangeByName('D1').columnWidth = 15;
    sheet.getRangeByName('E1').columnWidth = 15;
    sheet.getRangeByName('F1').columnWidth = 15;
    sheet.getRangeByName('G1').columnWidth = 15;
    sheet.getRangeByName('H1').columnWidth = 15;

    // 읽어온 excel 값 다시 엑셀에 재작성
    for (var table in excel.tables.keys) {
      print(table); //sheet Name
      sheetname_list.add(table);
      rows_list.add(excel.tables[table]!.maxRows);
      print(excel.tables[table]!.maxCols); // 가로 갯수
      print(excel.tables[table]!.maxRows); // 세로 갯수
      // for (var row in excel.tables[table]!.rows) {
      //   print("$row"); // 가로에 나열된 값(리스트 형태)
      // }
      for (int i = 0; i<excel.tables[table]!.rows.length; i++) {
        for(int j = 0; j<excel.tables[table]!.row(i).length; j++){
          print("??? ${excel.tables[table]!.row(i)[j]?.value}");
          if(excel.tables[table]!.row(i)[j]?.value != null){
            sheet.getRangeByIndex(i+1, j+1).setText(excel.tables[table]!.row(i)[j]?.value+"AA");
            print("${i+1} / ${j+1} ${excel.tables[table]!.row(i)[j]?.value+"AA"}");
          }
        }
      }
    }

    for(var r in rows_list){
      for(int i = 0; i<5; i++){
        for(int j = 0; j<8; j++){
          sheet.getRangeByIndex(r+i+1, j+1).setText("TestExcel A${i+1}/${j+1}");
          print("new data: TestExcel A${i+1}/${j+1}");
        }
      }
    }

    // sheet.getRangeByIndex(1, 2).setText('테스트1');
    // sheet.getRangeByIndex(1, 3).setText('테스트2');
    // sheet.getRangeByIndex(1, 4).setText('테스트3');
    // sheet.getRangeByIndex(1, 5).setText('테스트4');
    // sheet.getRangeByIndex(1, 6).setText('테스트5');
    // sheet.getRangeByIndex(1, 7).setText('테스트6');
    // sheet.getRangeByIndex(1, 8).setText('테스트7');
    //
    // sheet.getRangeByIndex(2, 1).setText('1');
    // sheet.getRangeByIndex(2, 2).setText('데이터1');
    // sheet.getRangeByIndex(2, 3).setText('데이터2');
    // sheet.getRangeByIndex(2, 4).setText('데이터3');
    // sheet.getRangeByIndex(2, 5).setText('데이터4');
    // sheet.getRangeByIndex(2, 6).setText('데이터5');
    // sheet.getRangeByIndex(2, 7).setText('데이터6');
    // sheet.getRangeByIndex(2, 8).setText('데이터7');
    //
    // sheet.getRangeByIndex(3, 1).setText('2');
    // sheet.getRangeByIndex(3, 2).setText('데이터8');
    // sheet.getRangeByIndex(3, 3).setText('데이터9');
    // sheet.getRangeByIndex(3, 4).setText('데이터10');
    // sheet.getRangeByIndex(3, 5).setText('데이터11');
    // sheet.getRangeByIndex(3, 6).setText('데이터12');
    // sheet.getRangeByIndex(3, 7).setText('데이터13');
    // sheet.getRangeByIndex(3, 8).setText('데이터14');


    //Save and launch the excel.
    final List<int> bytes = workbook.saveAsStream();
    //Dispose the document.
    workbook.dispose();

    //Save and launch the file.
    // await saveAndLaunchFile(bytes, 'Invoice.xlsx');

    // Directory directory = await getApplicationDocumentsDirectory();

    if(directory != null){
      File(join('${directory.path}/output_excel_test.xlsx'))
        ..createSync(recursive: true)
        ..writeAsBytesSync(bytes);
    } else {
      // save fail
    }
  }

  @override
  void initState() {
    super.initState();
    _PermissionRequest();
    readExcel();
  }

  _PermissionRequest() async {
    List<Permission> list_PG = [];

    Permission p_android_photos = Permission.photos;
    Permission p_android_storage = Permission.storage;
    Permission p_android_location = Permission.location;
    Permission p_android_location_allways = Permission.locationAlways;

    // list_PG.add(p_android_photos);
    list_PG.add(p_android_storage);
    // list_PG.add(p_android_location);
    // list_PG.add(p_android_location_allways);

    _PermissionCheck(list_PG, 0);

  }

  _PermissionCheck(List<Permission> list_PG, i) async{

    list_PG[i].request().then((value){

      switch (value) {
        case PermissionStatus.denied:

          if(i +1 < list_PG.length) {
            _PermissionCheck(list_PG, i+1);
          }
          break;
        case PermissionStatus.granted:
          if(i +1 < list_PG.length) {
            _PermissionCheck(list_PG, i+1);
          }
          break;
        case PermissionStatus.limited:

          if(i +1 < list_PG.length) {
            _PermissionCheck(list_PG, i+1);
          }
          break;
        default:
        //Colors.grey;
          if(i +1 < list_PG.length) {
            _PermissionCheck(list_PG, i+1);
          }
          break;
      }
    });
  }
}