

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testfun_project/Config.dart';
import 'package:testfun_project/Youtube/YoutubeAppDemo.dart';
import 'package:testfun_project/Youtube/YoutubePlayerPage.dart';
import 'package:testfun_project/Youtube/YoutubeTest.dart';

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
                SizedBox(height: 30,),
                Text("Test Function List", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
                SizedBox(height: 20,),
                Item("1. YouTubeTest", YoutubeTest()),
                Item("2. YouTubeTest", YoutubePlayerPage(videoId: "")),
                Item("3. YouTubeTest", YoutubeAppDemo()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Item(String page_name, StatefulWidget _fn){
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: InkWell(
        child: Container(
          padding: EdgeInsets.only(left: 10),
          color: Colors.black12,
          width: full_w, height: 40, alignment: Alignment.centerLeft,
          child: Text(page_name, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
        ),
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => _fn));
        },
      )
    );
  }

}