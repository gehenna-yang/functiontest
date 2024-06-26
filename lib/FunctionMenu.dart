

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testfun_project/Charts/Fl_BarChart1.dart';
import 'package:testfun_project/Charts/Fl_BarChart2.dart';
import 'package:testfun_project/Config.dart';
import 'package:testfun_project/DynamicLink/Dynamiclinks_test.dart';
import 'package:testfun_project/Excel/Excel_test.dart';
import 'package:testfun_project/Image/Easy_Image_Viewer.dart';
import 'package:testfun_project/List/Sliver/SliverListsTest.dart';
import 'package:testfun_project/Share/Share_test.dart';
import 'package:testfun_project/SlideMenu/ShrinkSideMenuTest.dart';
import 'package:testfun_project/SlideMenu/SliderdrawerTest.dart';
import 'package:testfun_project/Youtube/YoutubeAppDemo.dart';
import 'package:testfun_project/Youtube/YoutubePlayerPage.dart';
import 'package:testfun_project/Youtube/YoutubeTest.dart';
import 'package:testfun_project/qrcode/create_qrcode.dart';

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
                Item("1. YouTubeThumnail", YoutubeTest()),
                Item("2. YouTubeInfo", YoutubePlayerPage(videoId: "")),
                Item("3. YouTubePlayer", YoutubeAppDemo()),
                Item("4. Easy Image Viewer", Easy_Image_Viewer()),
                Item("5. Share test", const Share_test()),
                Item("6. Excel test", const CreateExcelStatefulWidget(title: "test excel")),
                Item("7. Dynamic test", Dynamiclinks_test()),
                Item("8. Create QR Code", const CreateQR()),
                Item("9. SliverList", const SliverListsTest()),
                Item("10. ShrinkSideMenu", ShrinkSideMenuTest(title: "ShrinkSideMenu",)),
                Item("11. SliderDrawer", const SliderDrawerTest()),
                Item("12. Fl Chart1", BarChartSample1()),
                Item("13. Fl Chart2", BarChartSample2()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Item(String page_name, StatefulWidget _fn){
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.only(left: 10),
          color: Colors.black12,
          width: full_w, height: 40, alignment: Alignment.centerLeft,
          child: Text(page_name, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => _fn));
        },
      )
    );
  }

  fun_Item(String page_name, Function? _fn){
    return Container(
        padding: const EdgeInsets.only(bottom: 10),
        child: InkWell(
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            color: Colors.black12,
            width: full_w, height: 40, alignment: Alignment.centerLeft,
            child: Text(page_name, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
          ),
          onTap: (){
            if(_fn != null){
              _fn();
            }
          },
        )
    );
  }

}