import 'package:flutter/material.dart';

void main() => runApp(new MyCalulatorApp());

class MyCalulatorApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Calculator',
        home: MyCalulator(),
    );
  }
}
class MyCalulator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => Calculator();

}

class Calculator extends State<MyCalulator>{

  //Register controller for TextFormField - we have 2 TFF
  final controller_numberA = TextEditingController();
  final controller_numberB = TextEditingController();
  final my_form_key = GlobalKey<FormState>();

  String textToShow ="";

  //Create funtion sum
  void sum(){
    //validate form
    if(my_form_key.currentState.validate())
      {
        int numberA = int.parse(controller_numberA.text);
        int numberB = int.parse(controller_numberB.text);
        int result = numberA + numberB ;

        setState(() {
          textToShow = "$numberA + $numberB = $result";
        });
      }
  }
  //Create funtion minus
  void minus(){
    //validate form
    if(my_form_key.currentState.validate())
    {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      int result = numberA - numberB ;

      setState(() {
        textToShow = "$numberA - $numberB = $result";
      });
    }
  }
  //Create funtion multiply
  void multiplication(){
    //validate form
    if(my_form_key.currentState.validate())
    {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      int result = numberA * numberB ;

      setState(() {
        textToShow = "$numberA * $numberB = $result";
      });
    }
  }
  //Create funtion divide
  void division(){
    //validate form
    if(my_form_key.currentState.validate())
    {
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      double result = numberA / numberB ;

      setState(() {
        textToShow = "$numberA / $numberB = $result";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //Create layout
    return new Scaffold(body: Form(key: my_form_key,child:
    Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //Create 2 textFormField in vertical
        TextFormField (
          controller: controller_numberA,
          validator: (value) {
            if (value.isEmpty) return "Please enter number";
          },
      decoration: InputDecoration(hintText: "Enter number"),
      keyboardType: TextInputType.number),
        TextFormField (
            controller: controller_numberB,
            validator: (value) {
              if (value.isEmpty) return "Please enter number";
            },
            decoration: InputDecoration(hintText: "Enter number"),
            keyboardType: TextInputType.number),
        //Create result textfield
        Text(textToShow,style: TextStyle(fontSize: 20.0),),
        //create 4 button
        Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
          RaisedButton(onPressed: sum,child: Text('+'),),
          RaisedButton(onPressed: minus,child: Text('-'),),
          RaisedButton(onPressed: multiplication,child: Text('*'),),
          RaisedButton(onPressed: division,child: Text('/'),),
        ],)
      ],
      )));
  }

}