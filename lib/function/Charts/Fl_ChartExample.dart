import 'package:flutter/material.dart';
import 'package:testfun_project/Config.dart';
import 'package:testfun_project/common/Widgets.dart';
import 'package:testfun_project/function/Charts/Fl_BarChart1.dart';
import 'package:testfun_project/function/Charts/Fl_BarChart2.dart';
import 'package:testfun_project/function/Charts/Fl_LineChart1.dart';
import 'package:testfun_project/function/Charts/Fl_LineChart5.dart';
import 'package:testfun_project/function/Charts/Fl_LineChart9.dart';
import 'package:testfun_project/function/Charts/Fl_RadarChart.dart';

class Fl_ChartTestList extends StatefulWidget {
  const Fl_ChartTestList({super.key});

  @override
  State<Fl_ChartTestList> createState() => _Fl_ChartTestListState();
}

class _Fl_ChartTestListState extends State<Fl_ChartTestList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Fl_Chart Test List Page',
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
              Item(context, "1. Fl BarChart1", BarChartSample1()),
              Item(context, "2. Fl BarChart2", BarChartSample2()),
              Item(context, "3. Fl LineChart1", const LineChartSample1()),
              Item(context, "4. Fl LineChart5", const LineChartSample5()),
              Item(context, "5. Fl LineChart9", LineChartSample9()),
              Item(context, "6. Fl RadarChart1", RadarChartSample1()),
            ],
          ),
        ),
      ),
    );
  }
}
