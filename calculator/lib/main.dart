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
  List<String> nums=[];
  int first_num=0;
  int last_num=0;
  String operator='';
  int before=0;
  int result=0;
  bool isTap=false;

  @override
  void initState() {
    super.initState();
    nums=[];
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
                    child: Text(isTap==false?first_num.toString():result.toString(), style: TextStyle(color: Colors.black, fontSize: 100, fontWeight: FontWeight.w300),),
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

  void onTapOperator(String name){
    if(first_num.isNaN){
      String first='';
      for(int i=0; i<nums.length; i++){
        first+=nums[i];
      }
      first_num=int.parse(first);
    }

    nums=[];
    operator=name;
    isTap=true;
    setState(() {});
  }

  void onTapAssign(){

    String res='';
    for(int i=0; i<nums.length; i++){
      res+=nums[i];
    }
    last_num=int.parse(res);

    if(operator=='+'){
      result=first_num + last_num;
    }else if(operator=='-'){
      result=first_num-last_num;
    }else if(operator=='x'){
      result=first_num*last_num;
    }else if(operator=='÷'){
      result=first_num~/last_num;
    }

    first_num=result;
    operator='';
    last_num=0;
    nums=[];
    setState(() {});
  }

  void onTapNumber(String num){
    print('onTapNumber');
    nums.add(num);
    print('nums $nums');

    setState(() {});
  }

  void onTapAc(){
    // number=0;
    first_num=0;
    nums=[];
    before=0;
    result=0;
    operator='';
    isTap=false;
    setState(() {});
  }

  Widget _acRowButtonWidgets(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _intButtonWidget('ac', 90, Colors.grey.withOpacity(0.7), ()=>onTapAc(), Colors.white),
        _intButtonWidget('+/- ', 90, Colors.grey.withOpacity(0.7), (){}, Colors.white),
        _intButtonWidget('%', 90, Colors.grey.withOpacity(0.7), (){}, Colors.white),
        _intButtonWidget('÷', 90, Colors.amber.withOpacity(0.7), ()=>onTapOperator('÷'), Colors.white),
      ],
    );
  }

  Widget _seventhRowButtonWidgets(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _intButtonWidget('7', 90, Colors.black87.withOpacity(0.7), ()=>onTapNumber('7'), Colors.white),
        _intButtonWidget('8', 90, Colors.black87.withOpacity(0.7), ()=>onTapNumber('8'), Colors.white),
        _intButtonWidget('9', 90, Colors.black87.withOpacity(0.7), ()=>onTapNumber('9'), Colors.white),
        _intButtonWidget('x', 90, Colors.amber.withOpacity(0.7), ()=>onTapOperator('x'), Colors.white),
      ],
    );
  }

  Widget _fourthRowButtonWidgets(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _intButtonWidget('4', 90, Colors.black87.withOpacity(0.7), ()=>onTapNumber('4'), Colors.white),
        _intButtonWidget('5', 90, Colors.black87.withOpacity(0.7), ()=>onTapNumber('5'), Colors.white),
        _intButtonWidget('6', 90, Colors.black87.withOpacity(0.7), ()=>onTapNumber('6'), Colors.white),
        _intButtonWidget('-', 90, Colors.amber.withOpacity(0.7), ()=>onTapOperator('-'), Colors.white),
      ],
    );
  }

  Widget _firstRowButtonWidgets(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _intButtonWidget('1', 90, Colors.black87.withOpacity(0.7), ()=>onTapNumber('1'), Colors.white),
        _intButtonWidget('2', 90, Colors.black87.withOpacity(0.7), ()=>onTapNumber('2'), Colors.white),
        _intButtonWidget('3', 90, Colors.black87.withOpacity(0.7), ()=>onTapNumber('3'), Colors.white),
        _intButtonWidget('+', 90, Colors.amber.withOpacity(0.7), ()=>onTapOperator('+'), Colors.white),
      ],
    );
  }

  Widget _zeroRowButtonWidgets(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _intButtonWidget('0', 200, Colors.black87.withOpacity(0.7), ()=>onTapNumber('0'), Colors.white),
        _intButtonWidget('.', 90, Colors.black87.withOpacity(0.7), (){}, Colors.white),
        _intButtonWidget('=', 90, Colors.amber.withOpacity(0.7), ()=>onTapAssign(), Colors.white),
      ],
    );
  }

  Widget _intButtonWidget(String name, double width, Color color, void Function() onTap, Color textColor,) {
    return InkWell(
      onTap: onTap,
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
