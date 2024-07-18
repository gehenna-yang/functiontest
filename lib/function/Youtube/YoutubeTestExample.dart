import 'package:flutter/material.dart';
import 'package:testfun_project/Config.dart';
import 'package:testfun_project/common/Widgets.dart';
import 'package:testfun_project/function/Youtube/YoutubeAppDemo.dart';
import 'package:testfun_project/function/Youtube/YoutubePlayerPage.dart';
import 'package:testfun_project/function/Youtube/YoutubeTest.dart';

class YoutubeTestList extends StatefulWidget {
  const YoutubeTestList({super.key});

  @override
  State<YoutubeTestList> createState() => _YoutubeTestListState();
}

class _YoutubeTestListState extends State<YoutubeTestList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Youtube Test Page', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: full_w,
          child: Column(
            children: [
              Item(context, "1. YouTubeThumnail", YoutubeTest()),
              Item(context, "2. YouTubeInfo", YoutubePlayerPage(videoId: "")),
              Item(context, "3. YouTubePlayer", YoutubeAppDemo()),
            ],
          ),
        ),
      ),
    );
  }
}
