import 'package:flutter/material.dart';
import 'package:flutter_calculator/calculator.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget{
  State<Calculator> createState() => _CalculatorState();
  
}

class _CalculatorState extends State<Calculator> {
  String userInput = " ";
  String result = " 0";

  List<String> buttonList =[
    'C','(',')','/',
    '7','8','9','*',
    '4','5','6','-',
    '1','2','3','+',
    '0',',','AC','='
  ];


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Flexible(child: resultWidget(), flex: 1,),
          Flexible(child: buttonWidget(), flex: 2),
        ],
      ),
    );
  }

  Widget resultWidget(){
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Text(
            userInput, 
          style: TextStyle(fontSize: 32),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Text(
            result, 
          style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget buttonWidget(){
    return GridView.builder(
      itemCount: buttonList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return button(buttonList[index]);       
      },
    ); 
    }

    Widget button(String text){
      return Container(
        margin: const EdgeInsets.all(8),
        child: MaterialButton(onPressed: (){
          setState(() {
             handleButtonPress(text);
          });
          },
          color: getColor(text),
          textColor: Colors.white,
          child: Text(
        text,
        style: const TextStyle(fontSize: 25),
          ),
          shape: const CircleBorder(),
          ),
      );
  }

  handleButtonPress(String text){

    if(text=="AC"){
      userInput="";
      result=" 0";
      return;
    }

    if(text=="C"){
      userInput =userInput.substring(0,userInput.length-1);
      return;
    }
    
    if(text=="="){
      result = calaulate();
      if(result.endsWith(".0"))
        result =result.replaceAll(".0", "");
      return;
    } 
    
    userInput = userInput+text;
  }

  String calaulate(){

    try{
      var exp = Parser().parse(userInput);
      var evaluation =exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    }
    catch(e){
      return "Error";
    }
    // return "result";
  }

  getColor(String text){

    if(
      text=="/" || 
      text=="*" || 
      text=="+" || 
      text=="-" ||
      text=="="){
      return Colors.orangeAccent;
    }
    if(text=="C"|| text=="AC"){
      return Colors.red;
    }
    if(text=="(" || text==")"){
      return Colors.blueGrey;
    }

    return Colors.lightBlue;
  }
}