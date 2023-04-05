import 'package:flutter/material.dart';
import 'package:timer_app/veiw/stopwatch_view.dart';
import 'package:timer_app/veiw/timer_view.dart';

class ScreenModel {
  WidgetBuilder builder;
  final String name;

  ScreenModel({
    required this.builder,
    required this.name,
  });
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = [
      ScreenModel(builder: (_) => TimerView(), name: 'TimerView'),
      ScreenModel(builder: (_) => StopWatchView(), name: 'StopWatchView'),
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: screen
              .map((e) => ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: e.builder));
                  },
                  child: Text(e.name)))
              .toList(),
        ),
      ),
    );
  }
}
