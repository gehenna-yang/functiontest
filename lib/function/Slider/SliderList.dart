import 'package:flutter/material.dart';
import 'package:testfun_project/Config.dart';
import 'package:testfun_project/common/Widgets.dart';
import 'package:testfun_project/function/Slider/AnotherXliderTest.dart';
import 'package:testfun_project/function/Slider/SliderTest.dart';

class Sliderlist extends StatefulWidget {
  const Sliderlist({super.key});

  @override
  State<Sliderlist> createState() => _SliderlistState();
}

class _SliderlistState extends State<Sliderlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Slider List Page',
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
              Item(context, "1. default Slider Test", const SliderTest()),
              Item(context, "2. AnotherXlider Test", const AnotherXliderTest()),
            ],
          ),
        ),
      ),
    );
  }
}
