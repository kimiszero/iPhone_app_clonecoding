import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StopWatchView extends StatefulWidget {
  StopWatchView({Key? key}) : super(key: key);

  @override
  State<StopWatchView> createState() => _StopWatchViewState();
}

class _StopWatchViewState extends State<StopWatchView> {
  final stopWatch = Stopwatch();
  bool isStarted = false;
  final int = 0;
  String leftBtn = '랩';
  String rightBtn = '시작';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Text(
              '00:00:00',
              style: TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            )),
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey.shade900,
                  child: CupertinoButton(
                      child: Text(
                        leftBtn,
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        stopWatch.stop();
                        setState(() {
                          if (isStarted == true) {
                            //TODO 랩
                          } else {
                            //TODO 초기화
                            isStarted = false;
                          }
                        });
                      }),
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundColor:
                      isStarted ? Colors.red.shade700 : Colors.green.shade700,
                  child: CupertinoButton(
                      child: Text(
                        rightBtn,
                        style: const TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {
                          isStarted = !isStarted;
                          if (isStarted) {
                            rightBtn = '중단';
                            leftBtn = '랩';
                          } else {
                            rightBtn = '시작';
                            leftBtn = '재설정';
                          }
                        });
                        stopWatch.start();
                        // Timer.periodic(Duration(milliseconds: 1), (timer) {
                        //   print(timer.tick);
                        // });
                      }),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.white,
            ),
            const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
