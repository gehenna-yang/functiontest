import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/handler.dart';
import 'package:another_xlider/models/handler_animation.dart';
import 'package:another_xlider/models/hatch_mark.dart';
import 'package:another_xlider/models/hatch_mark_label.dart';
import 'package:another_xlider/models/ignore_steps.dart';
import 'package:another_xlider/models/slider_step.dart';
import 'package:another_xlider/models/tooltip/tooltip.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:another_xlider/widgets/sized_box.dart';
import 'package:flutter/material.dart';

class AnotherXliderTest extends StatefulWidget {
  const AnotherXliderTest({super.key});

  @override
  State<AnotherXliderTest> createState() => _AnotherXliderTestState();
}

class _AnotherXliderTestState extends State<AnotherXliderTest> {
  double _lowerValue = 50;
  double _upperValue = 200;

  double _lv0 = 0.0;
  double _uv0 = 30.0;

  double _lv = 50.0;
  double _uv = 250.0;

  double _lv1 = 1000.0;
  double _uv1 = 15000.0;

  double _lv2 = 3000.0;
  double _uv2 = 17000.0;

  double _lv3 = 3000;
  double _uv3 = 3500;

  double _lv4 = 0;
  double _uv4 = 2500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Xlider Test'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // _singleSlider(),
            // _singleSlider(rtl: true),
            // _rangeSlider(),
            _rangeSliderIgnoreSteps(),
            _customHandler(),
            // _tooltipExample(),
            _hatchMarkWithLabels(),
          ],
        ),
      ),
    );
  }

  FlutterSliderHandler customHandler(IconData icon) {
    return FlutterSliderHandler(
      decoration: BoxDecoration(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.blue.withOpacity(0.3),
                spreadRadius: 0.05,
                blurRadius: 5,
                offset: Offset(0, 1))
          ],
        ),
        child: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.3), shape: BoxShape.circle),
          child: Icon(
            icon,
            color: Colors.white,
            size: 23,
          ),
        ),
      ),
    );
  }

  _singleSlider({bool rtl = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('Single Slider ' + (rtl ? 'RTL' : 'LTR')),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: FlutterSlider(
                handlerWidth: 30,
                rtl: rtl,
                handlerHeight: 30,
                values: [_lowerValue],
                max: 100,
                min: 0,
                tooltip: FlutterSliderTooltip(
                  disabled: true,
                ),
                trackBar: FlutterSliderTrackBar(
                    activeTrackBar:
                        BoxDecoration(color: Colors.blue.withOpacity(0.5))),
                onDragging: (handlerIndex, lowerValue, upperValue) {
                  setState(() {
                    _lowerValue = lowerValue;
                  });
                },
                onDragCompleted: (handlerIndex, lowerValue, upperValue) {
                  setState(() {
                    _lowerValue = lowerValue;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                child: Text(
                  _lowerValue.toInt().toString() + ' %',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _rangeSlider() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('Range Slider'),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: FlutterSlider(
              values: [_lv, _uv],
              rangeSlider: true,
              max: 3,
              min: 0,
              onDragging: (_handlerIndex, _lowerValue, _upperValue) {
                setState(() {
                  _lv = _lowerValue;
                  _uv = _upperValue;
                });
              },
            )),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                child: Text(
                  _lv.toInt().toString() + ' - ' + _uv.toInt().toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _rangeSliderIgnoreSteps() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: FlutterSlider(
            values: [_lv0, _uv0],
            rangeSlider: false,
            max: 30,
            min: 0,
            step: FlutterSliderStep(step: 15),
            jump: true,
            trackBar: FlutterSliderTrackBar(
              activeTrackBarHeight: 15,
              inactiveTrackBarHeight: 15,
              inactiveTrackBar: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              activeTrackBar: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
            ),
            tooltip: FlutterSliderTooltip(
              // textStyle: TextStyle(fontSize: 17, color: Colors.lightBlue),
              disabled: true,
            ),
            handler: FlutterSliderHandler(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
                border: Border.all(
                  color: Colors.green,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              child: const Icon(
                Icons.water_drop,
                size: 25,
                color: Colors.green,
              ),
            ),
            hatchMark: FlutterSliderHatchMark(
              displayLines: false,
              labelBox: FlutterSliderSizedBox(
                width: 40,
                height: 20,
                transform: Matrix4.translationValues(0, 30, 0),
              ),
              density: 0.02,
              labels: [
                FlutterSliderHatchMarkLabel(percent: 0, label: Text('Start')),
                FlutterSliderHatchMarkLabel(percent: 50, label: Text('Center')),
                FlutterSliderHatchMarkLabel(
                    percent: 100, label: Text('Finish')),
              ],
            ),
            onDragging: (_handlerIndex, _lowerValue, _upperValue) {
              setState(() {
                _lv0 = _lowerValue;
                _uv0 = _upperValue;
                print('???? $_lv0 / $_uv0');
              });
            },
          )),
        ],
      ),
    );
  }

  _customHandler() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('Range Slider - Custom Handler'),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: FlutterSlider(
              values: [_lv2, _uv2],
              rangeSlider: true,
              max: 25000,
              min: 0,
              step: FlutterSliderStep(step: 100),
              jump: true,
              trackBar: FlutterSliderTrackBar(
                inactiveTrackBarHeight: 2,
                activeTrackBarHeight: 3,
              ),
              disabled: false,
              handler: customHandler(Icons.chevron_right),
              rightHandler: customHandler(Icons.chevron_left),
              tooltip: FlutterSliderTooltip(
                leftPrefix: Icon(
                  Icons.attach_money,
                  size: 19,
                  color: Colors.black45,
                ),
                rightSuffix: Icon(
                  Icons.attach_money,
                  size: 19,
                  color: Colors.black45,
                ),
                textStyle: TextStyle(fontSize: 17, color: Colors.black45),
              ),
              onDragging: (_handlerIndex, _lowerValue, _upperValue) {
                setState(() {
                  _lv2 = _lowerValue;
                  _uv2 = _upperValue;
                });
              },
            )),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                child: Text(
                  _lv2.toInt().toString() + ' - ' + _uv2.toInt().toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _tooltipExample() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('Range Slider - tooltip example'),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: FlutterSlider(
              key: Key('3343'),
              values: [_lv3, _uv3],
              rangeSlider: true,
              tooltip: FlutterSliderTooltip(
                alwaysShowTooltip: true,
              ),
              max: 4000,
              min: 0,
              step: FlutterSliderStep(step: 20),
              jump: true,
              onDragging: (_handlerIndex, _lowerValue, _upperValue) {
                setState(() {
                  _lv3 = _lowerValue;
                  _uv3 = _upperValue;
                });
              },
            )),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                child: Text(
                  _lv3.toInt().toString() + ' - ' + _uv3.toInt().toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _hatchMarkWithLabels() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text('Range Slider - Hatch Mark with labels'),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: FlutterSlider(
              key: Key('3343'),
              values: [_lv4, _uv4],
              // touchSize: 50.0,
              // handlerAnimation: const FlutterSliderHandlerAnimation(
              //     reverseCurve: Curves.bounceOut,
              //     curve: Curves.bounceIn,
              //     duration: Duration(milliseconds: 100),
              //     scale: 1.5),
              // rangeSlider: true,
              rangeSlider: false,
              ignoreSteps: [
                FlutterSliderIgnoreSteps(from: 500, to: 1000),
              ],
              hatchMark: FlutterSliderHatchMark(
                displayLines: true,
                linesDistanceFromTrackBar: 10,
                labelBox: FlutterSliderSizedBox(
                  width: 40,
                  height: 20,
                  transform: Matrix4.translationValues(0, 30, 0),
                ),
                density: 0.02,
                labels: [
                  FlutterSliderHatchMarkLabel(percent: 0, label: Text('Start')),
                  // FlutterSliderHatchMarkLabel(percent: 20, label: Text('N/A')),
                  // FlutterSliderHatchMarkLabel(percent: 10, label: Text('10 %')),
                  FlutterSliderHatchMarkLabel(percent: 50, label: Text('50 %')),
                  // FlutterSliderHatchMarkLabel(percent: 80, label: Text('80 %')),
                  FlutterSliderHatchMarkLabel(
                      percent: 100, label: Text('Finish')),
                ],
              ),
              // rightHandler: FlutterSliderHandler(
              //   decoration: BoxDecoration(),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       color: Colors.blue,
              //       shape: BoxShape.circle,
              //     ),
              //   ),
              // ),
              // tooltip: FlutterSliderTooltip(
              //   alwaysShowTooltip: false,
              // ),
              max: 4000,
              min: 0,
              step: const FlutterSliderStep(step: 3),
              jump: true,
              onDragging: (_handlerIndex, _lowerValue, _upperValue) {
                setState(() {
                  _lv4 = _lowerValue;
                  _uv4 = _upperValue;
                });
              },
            )),
          ],
        ),
      ),
    );
  }
}
