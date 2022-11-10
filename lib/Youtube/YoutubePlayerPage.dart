

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testfun_project/Config.dart';
import 'package:youtube_metadata/youtube_metadata.dart';

class YoutubePlayerPage extends StatefulWidget {
  String videoId;

  YoutubePlayerPage({
    required this.videoId
  });

  @override
  YoutubePlayerPageState createState() => YoutubePlayerPageState();
}

class YoutubePlayerPageState extends State<YoutubePlayerPage> {

  static const String hintText = "Paste the link here....";
  late MetaDataModel? metaData;

  @override
  void initState() {
    super.initState();
    _fetchMetadata("https://www.youtube.com/watch?v=4DORFvkixwY");
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _fetchMetadata(String link) async {
    try {
      metaData = await YoutubeMetaData.getData(link);
    } catch (e) {
      metaData = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
          title: Text("유튜브 테스트"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                onSubmitted: (e) => _fetchMetadata(e),
                decoration: InputDecoration(hintText: hintText),
              ),
              metaData == null
                  ? Container()
                  : Container(
                child: Column(
                  children: [
                    Image.network(metaData!.thumbnailUrl!),
                    Divider(),
                    Text(metaData!.title!),
                    Divider(color: Colors.transparent),
                    Text(
                      '''channel name :  ${metaData!.authorName} \n\nchannel url :${metaData!.authorUrl}
                        ''',
                    ),
                    Divider(color: Colors.transparent),
                    Text('description: ${metaData!.description}'),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}