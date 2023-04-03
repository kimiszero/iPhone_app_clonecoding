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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            renderTimer(),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey.shade900,
                  child: CupertinoButton(
                      child: Text('취소', style: TextStyle(color: Colors.black54),), onPressed: (){}),
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.green.shade700..opacity,
                  child: CupertinoButton(
                      child: Text('시작', style: TextStyle(color: Colors.green.shade900),), onPressed: (){}),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }

  Widget renderTimer(){
    return Center(
      child: CupertinoTheme(
        data: CupertinoThemeData(
            brightness: Brightness.dark
        ),
        child: CupertinoTimerPicker(
          mode: CupertinoTimerPickerMode.hms,
          onTimerDurationChanged: (Duration newDuration) {},
        ),
      ),
    );
  }
}
