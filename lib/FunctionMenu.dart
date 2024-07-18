

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testfun_project/common/Widgets.dart';
import 'package:testfun_project/function/Charts/Fl_ChartExample.dart';
import 'package:testfun_project/Config.dart';
import 'package:testfun_project/function/DynamicLink/Dynamiclinks_test.dart';
import 'package:testfun_project/function/Excel/Excel_test.dart';
import 'package:testfun_project/function/Image/Easy_Image_Viewer.dart';
import 'package:testfun_project/function/List/Sliver/SliverListsTest.dart';
import 'package:testfun_project/function/Share/Share_test.dart';
import 'package:testfun_project/function/SlideMenu/ShrinkSideMenuTest.dart';
import 'package:testfun_project/function/SlideMenu/SliderdrawerTest.dart';
import 'package:testfun_project/function/Youtube/YoutubeTestExample.dart';
import 'package:testfun_project/function/qrcode/create_qrcode.dart';

class FunctionMenu extends StatefulWidget {

  @override
  FunctionMenuState createState() => FunctionMenuState();
}

class FunctionMenuState extends State<FunctionMenu> {

  DateTime pre_backpress = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    full_w = MediaQuery.of(context).size.width;
    full_h = MediaQuery.of(context).size.height;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () async{
        final timegap = DateTime.now().difference(pre_backpress);
        final cantExit = timegap >= Duration(milliseconds: 500);
        pre_backpress = DateTime.now();

        if (!cantExit) {
          SystemNavigator.pop();
          return false;
        }else {
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            width: full_w,
            child: Column(
              children: [
                const SizedBox(height: 30,),
                const Text("Test Function List", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
                const SizedBox(height: 20,),
                Item(context, "1. Youtube Test Page", const YoutubeTestList()),
                Item(context, "2. Easy Image Viewer", Easy_Image_Viewer()),
                Item(context, "3. Share test", const Share_test()),
                Item(context, "4. Excel test", const CreateExcelStatefulWidget(title: "test excel")),
                Item(context, "5. Dynamic test", Dynamiclinks_test()),
                Item(context, "6. Create QR Code", const CreateQR()),
                Item(context, "7. SliverList", const SliverListsTest()),
                Item(context, "8. ShrinkSideMenu", ShrinkSideMenuTest(title: "ShrinkSideMenu",)),
                Item(context, "9. SliderDrawer", const SliderDrawerTest()),
                Item(context, "10. Fl_Chart Test Page", const Fl_ChartTestList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
