import 'package:flutter/material.dart';

class SliderTest extends StatefulWidget {
  const SliderTest({super.key});

  @override
  State<SliderTest> createState() => _SliderTestState();
}

class _SliderTestState extends State<SliderTest> {
  double currentValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Slider Test'),
        ),
        body: Slider(
          activeColor: Colors.amber,
          inactiveColor: Colors.deepOrange,
          secondaryActiveColor: Colors.blue,
          thumbColor: Colors.green,
          value: currentValue,
          max: 100,
          divisions: 2,
          onChanged: (value) => setState(() {
            currentValue = value;
          }),
        ));
  }
}
