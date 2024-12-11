import 'package:flutter/material.dart';
import 'package:testfun_project/Config.dart';
import 'package:testfun_project/common/Widgets.dart';

class ButtonTestList extends StatefulWidget {
  const ButtonTestList({super.key});

  @override
  State<ButtonTestList> createState() => _ButtonTestListState();
}

class _ButtonTestListState extends State<ButtonTestList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Button Test List Page',
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
              // Item(context, "1. Fl BarChart1", BarChartSample1()),
            ],
          ),
        ),
      ),
    );
  }
}
