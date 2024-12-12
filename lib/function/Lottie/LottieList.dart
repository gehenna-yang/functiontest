import 'package:flutter/material.dart';
import 'package:testfun_project/Config.dart';
import 'package:testfun_project/common/Widgets.dart';

class LottieList extends StatefulWidget {
  const LottieList({super.key});

  @override
  State<LottieList> createState() => _LottieListState();
}

class _LottieListState extends State<LottieList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'LottieList Page',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: full_w,
          child: Column(
            children: [
              ItemShow(
                context,
                page_name: "1. loading1",
                path: 'assets/loading1.json',
                height: 50,
              ),
              ItemShow(
                context,
                page_name: "2. loading2",
                path: 'assets/loading2.json',
                height: 150,
              ),
              ItemShow(
                context,
                page_name: "3. loading3",
                path: 'assets/loading3.json',
                height: 150,
              ),
              ItemShow(
                context,
                page_name: "4. loading4 - cat",
                path: 'assets/catloading.json',
                height: 150,
              ),
              ItemShow(
                context,
                page_name: "5. plant grow up",
                path: 'assets/plantgrowup.json',
                height: 250,
              ),
              ItemShow(
                context,
                page_name: "6. plant grow up2",
                path: 'assets/plantgrowup2.json',
                height: 250,
              ),
              ItemShow(
                context,
                page_name: "7. plant grow up3",
                path: 'assets/plantgrowup3.json',
                height: 250,
              ),
              ItemShow(
                context,
                page_name: "8. plant person",
                path: 'assets/plantperson.json',
                height: 250,
              ),
              ItemShow(
                context,
                page_name: "9. draw tree",
                path: 'assets/drawtree.json',
                height: 250,
              ),
              ItemShow(
                context,
                page_name: "10. grow up tree",
                path: 'assets/growuptree.json',
                height: 250,
              ),
              ItemShow(
                context,
                page_name: "11. rotate plant",
                path: 'assets/rotateplant.json',
                height: 250,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
