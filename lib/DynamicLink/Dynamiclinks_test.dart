

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:testfun_project/Config.dart';
import 'package:url_launcher/url_launcher.dart';

class Dynamiclinks_test extends StatefulWidget {

  @override
  Dynamiclinks_testState createState() => new Dynamiclinks_testState();
}

class Dynamiclinks_testState extends State<Dynamiclinks_test> {
  String? _linkMessage;
  bool _isCreatingLink = false;

  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  final String _testString =
      'To test: long press link and then copy and click from a non-browser '
      "app. Make sure this isn't being tested on iOS simulator and iOS xcode "
      'is properly setup. Look at firebase_dynamic_links/README.md for more '
      'details.';

  final String DynamicLink = 'https://wafflestay.comhelloworld';
  final String Link = 'https://wafflestay.page.link/iDzQ';

  @override
  void initState() {
    super.initState();
    initDynamicLinks();
  }

  Future<void> initDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      print("dynamic link data: ${dynamicLinkData.link.path}");
      // Navigator.pushNamed(context, dynamicLinkData.link.path);
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
  }

  Future<void> _createDynamicLink(bool short) async {
    setState(() {
      _isCreatingLink = true;
    });

    Uri img = Uri.parse("https://wafflestay-content-bucket.s3.ap-northeast-2.amazonaws.com/banner/asset/20221109/ff83f9a4-6ff0-4224-8f3a-d3c942df0785/upload.jpg");

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://wafflestay.page.link/iDzQ',
      longDynamicLink: Uri.parse(
        'https://wafflestay.page.link/iDzQ/?category=share&hotel_id=193580&hotel_name=testhotel&inclusive=0&exclusive=0',
      ),
      // link: Uri.parse(DynamicLink),
      link: Uri.parse('category=share&hotel_id=193580&hotel_name=testhotel&inclusive=0&exclusive=0'),
      socialMetaTagParameters: const SocialMetaTagParameters(
        title: "test",
        // imageUrl: img,
        description: "description",
      ),
      androidParameters: const AndroidParameters(
        packageName: 'com.swave.wafflestay',
        minimumVersion: 0,
      ),
      // iosParameters: const IOSParameters(
      //   bundleId: 'io.flutter.plugins.firebase.dynamiclinksexample',
      //   minimumVersion: '0',
      // ),
    );

    Uri url;
    if (short) {
      final ShortDynamicLink shortLink =
      await dynamicLinks.buildShortLink(parameters);
      url = shortLink.shortUrl;
    } else {
      url = await dynamicLinks.buildLink(parameters);
    }


    print("create: ${url.toString()}");

    setState(() {
      _linkMessage = url.toString();
      _isCreatingLink = false;
    });

    // Share.share(url.toString());

    if (await canLaunchUrl(url)) {
      launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dynamic Links Example'),
        ),
        body: Builder(
          builder: (BuildContext context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () async {
                          final PendingDynamicLinkData? data =
                          await dynamicLinks.getInitialLink();
                          final Uri? deepLink = data?.link;

                          print("getInitialLink: ${deepLink!.path}");
                          if (deepLink != null) {
                            // ignore: unawaited_futures
                            Navigator.pushNamed(context, deepLink.path);
                          }
                        },
                        child: const Text('getInitialLink'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final PendingDynamicLinkData? data =
                          await dynamicLinks
                              .getDynamicLink(Uri.parse(Link));
                          final Uri? deepLink = data?.link;

                          print("getDynamicLink: ${deepLink!.path}");
                          if (deepLink != null) {
                            // ignore: unawaited_futures
                            Navigator.pushNamed(context, deepLink.path);
                          }
                        },
                        child: const Text('getDynamicLink'),
                      ),
                      ElevatedButton(
                        onPressed: !_isCreatingLink
                            ? () => _createDynamicLink(false)
                            : null,
                        child: const Text('Get Long Link'),
                      ),
                      ElevatedButton(
                        onPressed: !_isCreatingLink
                            ? () => _createDynamicLink(true)
                            : null,
                        child: const Text('Get Short Link'),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () async {
                      if (_linkMessage != null) {
                        await launchUrl(Uri.parse(_linkMessage!));
                      }
                    },
                    onLongPress: () {
                      Clipboard.setData(ClipboardData(text: _linkMessage));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Copied Link!')),
                      );
                    },
                    child: Text(
                      _linkMessage ?? '',
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),
                  Text(_linkMessage == null ? '' : _testString)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _DynamicLinkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hello World DeepLink'),
        ),
        body: const Center(
          child: Text('Hello, World!'),
        ),
      ),
    );
  }
}