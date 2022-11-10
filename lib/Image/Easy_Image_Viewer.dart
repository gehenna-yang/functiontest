

import 'package:flutter/material.dart';
import 'package:testfun_project/Config.dart';

class Easy_Image_Viewer extends StatefulWidget {

  @override
  Easy_Image_ViewerState createState() => new Easy_Image_ViewerState();
}

class Easy_Image_ViewerState extends State<Easy_Image_Viewer>{

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Easy_Image_Viewer"),
      ),
      body: Container(
        width: full_w, height: full_h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          ],
        ),
      ),
    );
  }
}