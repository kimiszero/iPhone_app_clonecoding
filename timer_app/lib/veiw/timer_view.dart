import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerView extends StatefulWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  int? selectedHour;
  int? selectedMin;
  int? selectedSec;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CupertinoTimerPicker(
              backgroundColor: Colors.black,
              mode: CupertinoTimerPickerMode.hms,
              onTimerDurationChanged: (Duration newDuration) {},
            ),
          ),
        ],
      ),
    );
  }
}
