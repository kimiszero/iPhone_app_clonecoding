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

  //The value which will be check the state for start
  bool isStarted = false;

  //The value for buttons
  String leftBtn = '랩';
  String rightBtn = '시작';

  //The result which will be displayed on the screen
  String _result = '00:00:00';

  //The list which will be recorded the results;
  List<String> _results = [];

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
    isStarted = true;
    rightBtn = '중단';
    leftBtn = '랩';
  }

  // This function will be called when the user presses the Stop Button
  void _stop() {
    _timer.cancel();
    _stopWatch.stop();
    setState(() {
      isStarted = false;
      rightBtn = '시작';
      leftBtn = '재설정';
    });
  }

  //This function will be called when the user presses the Reset button
  void _reset() {
    _stop();
    _stopWatch.reset();

    //Update the UI
    setState(() {
      leftBtn = '랩';
      _result = '00:00:00';
      _results=[];
    });
  }

  //This function will be record when the user presses the Lap button
  void _laps() {
    _results.add(_result);

    //Update the UI
    setState(() {});
  }

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
            SizedBox(height: 180),
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
                    onPressed: isStarted ? _laps : _reset,
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
                    onPressed: isStarted ? _stop : _start,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: _results.length,
                itemBuilder: (context, index) {

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                       if(index==0)  const Divider(
                          color: Colors.white,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '랩 ${index + 1}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                            Text(
                              _results[index],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
