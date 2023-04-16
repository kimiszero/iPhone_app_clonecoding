import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class TimerView extends StatefulWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isPlaying = false;
  bool isPaused = false;

  String get countText {
    Duration count = controller.duration! * controller.value;
    String result = '';
    if (controller.isDismissed) {
      result =
          '${controller.duration!.inHours == 0 ? "" : "${controller.duration!.inHours}:"}${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}';
    } else {
      result =
          '${(count.inHours).toString() == '0' ? '' : (count.inHours).toString().padLeft(2, '0')}${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
    }
    return result;
  }

  double progress = 1.0;

  void makeSoundAndReset() {
    FlutterRingtonePlayer.playNotification();
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    controller.addListener(() {
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
            isPlaying ? renderStartTimer() : renderTimer(),
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
                      onPressed: () {
                        controller.reset();
                        setState(() {
                          isPlaying = false;
                        });
                      }),
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundColor: isPlaying
                      ? (isPaused
                          ? (Colors.green.shade700..opacity)
                          : Colors.orange.shade700
                        ..opacity)
                      : Colors.green.shade700
                    ..opacity,
                  child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: Text(
                        isPlaying
                            ? isPaused
                                ? '재개'
                                : '일시정지'
                            : '시작',
                        style: const TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if(countText=='00:00'){
                          return;
                        }
                        if (controller.isAnimating) {
                          controller.stop();
                          setState(() {
                            isPaused = true;
                            isPlaying=false;
                          });
                          initState();
                        } else {
                          controller.reverse(
                              from: controller.value == 0
                                  ? progress
                                  : controller.value);
                          setState(() {
                            isPaused = false;
                            isPlaying = true;
                          });
                        }
                      }),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '타이머 종료 시',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
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
                      onPressed: () {
                        print('Hi!');
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderStartTimer() {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 350,
              width: 350,
              child: CircularProgressIndicator(
                color: Colors.orange,
                value: progress,
                strokeWidth: 8,
              ),
            ),
            Positioned(
              left: countText.length > 5 ? 33 : 55,
              top: 123,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        countText,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 80,
                            fontWeight: FontWeight.w200),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget renderTimer() {
    return Center(
      child: CupertinoTheme(
        data: const CupertinoThemeData(brightness: Brightness.dark),
        child: CupertinoTimerPicker(
          initialTimerDuration: controller.duration!,
          mode: CupertinoTimerPickerMode.hms,
          onTimerDurationChanged: (Duration newDuration) {
            setState(() {
              controller.duration = newDuration;
            });
          },
        ),
      ),
    );
  }
}
