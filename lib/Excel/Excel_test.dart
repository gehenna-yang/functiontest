

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' hide Column;

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

  Future<void> generateExcel() async {
    //Create a Excel document.

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
    sheet.getRangeByName('E1').columnWidth = 7.50;
    sheet.getRangeByName('F1').columnWidth = 9.73;
    sheet.getRangeByName('G1').columnWidth = 8.82;
    sheet.getRangeByName('H1').columnWidth = 4.46;

    sheet.getRangeByName('B2').setText('test');
    sheet.getRangeByIndex(2, 3).setText('excel');
    sheet.getRangeByIndex(2, 4).setText('염병');
    sheet.getRangeByIndex(3, 3).setText('c8');

    //Save and launch the excel.
    final List<int> bytes = workbook.saveAsStream();
    //Dispose the document.
    workbook.dispose();

    //Save and launch the file.
    // await saveAndLaunchFile(bytes, 'Invoice.xlsx');

    // Directory directory = await getApplicationDocumentsDirectory();
    Directory? directory = await getExternalStorageDirectory();
    debugPrint('directory : $directory/${directory!.path}');

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