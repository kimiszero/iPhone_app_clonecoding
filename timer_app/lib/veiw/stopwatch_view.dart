import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StopWatchView extends StatefulWidget {
  StopWatchView({Key? key}) : super(key: key);

  @override
  State<StopWatchView> createState() => _StopWatchViewState();
}

class _StopWatchViewState extends State<StopWatchView> {
  //Initialize an instance of StopWatch
  final _stopWatch = Stopwatch();

  //Timer
  late Timer _timer;

  //The result which will be displayed on the screen
  String _result = '00:00:00';

  // function will be called when the user presses the StartButton
  void _start() {
    //Timer.periodic() will call the callback function every 100 milliseconds
    _timer = Timer.periodic(Duration(milliseconds: 40), (t) {
      //Update UI
      setState(() {
        //result in hh:mm:ss
        _result =
            '${_stopWatch.elapsed.inMinutes.toString().padLeft(2, '0')}:${(_stopWatch.elapsed.inSeconds % 60).toString().padLeft(2, '0')}:${(_stopWatch.elapsed.inMilliseconds % 100).toString().padLeft(2, '0')}';
      });
    });
    //Start the stopwatch
    _stopWatch.start();
    isStarted=true;
    rightBtn='중단';
  }

  // This function will be called when the user presses the Stop Button
  void _stop() {
    _timer.cancel();
    _stopWatch.stop();
    setState(() {
      isStarted=false;
      rightBtn='시작';
    });
  }

  //This function will be called when the user presses the Reset button
  void _reset() {
    _stop();
    _stopWatch.reset();

    //Update the UI
    setState(() {
      _result = '00:00:00';
    });
  }

  bool isStarted = false;
  int ms = 0;
  int sec = 0;
  int min = 0;

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
              // '${min.toString().padLeft(2, '0')}:${sec.toString().padLeft(2, '0')}:${ms.toString().padLeft(2, '0')}',
              _result,
              style: const TextStyle(
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
                        style: const TextStyle(color: Colors.white),
                      ),
                      onPressed: _reset,
                      //onPressed: () {
                        // _stopWatch.stop();
                        // setState(() {
                        //   if (isStarted == true) {
                        //     //TODO 랩
                        //   } else {
                        //     //TODO 초기화
                        //     isStarted = false;
                        //
                        //     min = 0;
                        //     sec = 0;
                        //     ms = 0;
                        //   }
                        // });
                      //}
                    ),
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
                    onPressed: isStarted? _stop:_start,
                    // setState(() {
                    //   isStarted = !isStarted;
                    //   if (isStarted) {
                    //     rightBtn = '중단';
                    //     leftBtn = '랩';
                    //     Timer.periodic(const Duration(milliseconds: 1), (timer) {
                    //       int temp= timer.tick;
                    //       ms=temp;
                    //       if(ms>59){
                    //         sec+=temp~/60;
                    //         ms=temp%(60*sec);
                    //       }else if(sec>59){
                    //         min+=sec~/60;
                    //         sec=temp%(60*min);
                    //         ms=temp%(60*min);
                    //       }
                    //     });
                    //   } else {
                    //     rightBtn = '시작';
                    //     leftBtn = '재설정';
                    //
                    //   }
                    //}
                  ),
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
