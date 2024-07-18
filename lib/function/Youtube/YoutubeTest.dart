
import 'package:flutter/material.dart';
import 'package:testfun_project/Config.dart';
import 'package:youtube/youtube_thumbnail.dart';

class YoutubeTest extends StatefulWidget {

  @override
  YoutubeTestState createState() => YoutubeTestState();
}

class YoutubeTestState extends State<YoutubeTest> {

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
    var text = '_AZKZam9d_8';
    var _w = (full_w-30)/2;
    return WillPopScope(
      onWillPop: () async{
        try {
          Navigator.of(context).pop(null);
          return false;
        } catch (e) {
          return false;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text("Youtube test page"),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.black38,
            width: full_w,
            child: Column(
              children: [
                SizedBox(height: 20),
                Image.network(YoutubeThumbnail(youtubeId: text).hd(), width: _w, height: _w/1.8,),
                SizedBox(height: 20),
                Image.network(YoutubeThumbnail(youtubeId: text).standard(), width: _w, height: _w/1.8,),
                SizedBox(height: 20),
                Image.network(YoutubeThumbnail(youtubeId: text).hq(), width: _w, height: _w/1.8,),
                SizedBox(height: 20),
                Image.network(YoutubeThumbnail(youtubeId: text).mq(), width: _w, height: _w/1.8,),
                SizedBox(height: 20),
                Image.network(YoutubeThumbnail(youtubeId: text).small(), width: _w, height: _w/1.8,),
                SizedBox(height: 20),
              ],
            )
          ),
        ),
      ),
    );
  }
}