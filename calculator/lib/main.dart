import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Calculator();
  }
}

class Calculator extends StatefulWidget {
  Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  List<dynamic> item = [
    0, '.', '=', 1, 2, 3, '+', 4, 5, 6, '-', 7, 8, 9, 'x', 'AC', '+/-', '%', '➗'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text('0', style: TextStyle(color: Colors.black, fontSize: 100, fontWeight: FontWeight.w300),),
                  ),
                ],
              ),
              _acRowButtonWidgets(),
              _seventhRowButtonWidgets(),
              _fourthRowButtonWidgets(),
              _firstRowButtonWidgets(),
              _zeroRowButtonWidgets(),
            ],
          )),
    );
  }

  Widget _acRowButtonWidgets(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _intButtonWidget('ac', 90, Colors.grey.withOpacity(0.7), (){}, Colors.white),
        _intButtonWidget('+/- ', 90, Colors.grey.withOpacity(0.7), (){}, Colors.white),
        _intButtonWidget('%', 90, Colors.grey.withOpacity(0.7), (){}, Colors.white),
        _intButtonWidget('÷', 90, Colors.amber.withOpacity(0.7), (){}, Colors.white),
      ],
    );
  }

  Widget _seventhRowButtonWidgets(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _intButtonWidget('7', 90, Colors.black87.withOpacity(0.7), (){}, Colors.white),
        _intButtonWidget('8', 90, Colors.black87.withOpacity(0.7), (){}, Colors.white),
        _intButtonWidget('9', 90, Colors.black87.withOpacity(0.7), (){}, Colors.white),
        _intButtonWidget('x', 90, Colors.amber.withOpacity(0.7), (){}, Colors.white),
      ],
    );
  }

  Widget _fourthRowButtonWidgets(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _intButtonWidget('4', 90, Colors.black87.withOpacity(0.7), (){}, Colors.white),
        _intButtonWidget('5', 90, Colors.black87.withOpacity(0.7), (){}, Colors.white),
        _intButtonWidget('6', 90, Colors.black87.withOpacity(0.7), (){}, Colors.white),
        _intButtonWidget('-', 90, Colors.amber.withOpacity(0.7), (){}, Colors.white),
      ],
    );
  }

  Widget _firstRowButtonWidgets(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _intButtonWidget('1', 90, Colors.black87.withOpacity(0.7), (){}, Colors.white),
        _intButtonWidget('2', 90, Colors.black87.withOpacity(0.7), (){}, Colors.white),
        _intButtonWidget('3', 90, Colors.black87.withOpacity(0.7), (){}, Colors.white),
        _intButtonWidget('+', 90, Colors.amber.withOpacity(0.7), (){}, Colors.white),
      ],
    );
  }

  Widget _zeroRowButtonWidgets(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _intButtonWidget('0', 200, Colors.black87.withOpacity(0.7), (){}, Colors.white),
        _intButtonWidget('.', 90, Colors.black87.withOpacity(0.7), (){}, Colors.white),
        _intButtonWidget('=', 90, Colors.amber.withOpacity(0.7), (){}, Colors.white),
      ],
    );
  }

  Widget _intButtonWidget(String name, double width, Color color, Function onTap, Color textColor,) {
    return InkWell(
      onTap: onTap(),
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: name=='0'? BorderRadius.circular(50):null,
          shape: name!='0'? BoxShape.circle:BoxShape.rectangle,
          color: color,
        ),
        width: width,
        height: 90,
        child: Center(
            child: Text(
              name.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: textColor, fontSize: 48),
            )),
      ),
    );
  }
}
