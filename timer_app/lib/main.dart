import 'package:flutter/material.dart';
import 'package:timer_app/veiw/home_view.dart';
import 'package:timer_app/veiw/timer_view.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}
