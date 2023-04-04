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
                      child: Text(
                        '취소',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {}),
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.green.shade700..opacity,
                  child: CupertinoButton(
                      child: Text(
                        '시작',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {}),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('타이머 종료 시', style: TextStyle(color: Colors.white, fontSize: 17),),
                  CupertinoButton(
                      child: Row(
                        children: const [
                          Text(
                            '전파 탐지기',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderTimer() {
    return Center(
      child: CupertinoTheme(
        data: CupertinoThemeData(brightness: Brightness.dark),
        child: CupertinoTimerPicker(
          mode: CupertinoTimerPickerMode.hms,
          onTimerDurationChanged: (Duration newDuration) {},
        ),
      ),
    );
  }
}
