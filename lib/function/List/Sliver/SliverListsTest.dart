import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:testfun_project/Config.dart';

class SliverListsTest extends StatefulWidget {
  const SliverListsTest({super.key});

  @override
  State<SliverListsTest> createState() => _SliverListsTestState();
}

class _SliverListsTestState extends State<SliverListsTest> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text('SliverTest'),
      ),
      body: const CustomScrollView(
        slivers: [
          SliverTestCode()
        ]
      ),
    );
  }
}

class SliverTestCode extends StatelessWidget {
  const SliverTestCode({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 10, (context, index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.deepPurple[100*(index % 10)],
            child: Text('List Item $index', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black),),
          );
        }
      ),
    );
  }
}

