import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int firstNumber = 0;
  int secondNumber = 0;
  String result = "";
  String res = "";
  String disResult = "";
  String opt = "";
  String ex1 = "";
  String ex2 = "";

  void backEnd(String btnName) {
    setState(() {
      if (btnName == "C") {
        result = "";
        disResult = "";
        opt = "";
        firstNumber = 0;
        secondNumber = 0;
        ex1 = "0";
        ex2 = "0";
      }
      else if (btnName == "+" || btnName == "-" || btnName == "x" || btnName == "/"){
        opt = btnName;
        firstNumber = int.parse(disResult);
        ex2 = disResult;
        disResult = "";
        ex1 = "";
      }
      else if (btnName == "=") {
        secondNumber = int.parse(disResult);
        if (opt == "+"){
          result = (firstNumber + secondNumber).toString();
        }
        else if(opt == "-"){
          result = (firstNumber - secondNumber).toString();
        }
        else if (opt == "x"){
          result = (firstNumber * secondNumber).toString();
        }
        else if (opt == "/"){
          result = (firstNumber / secondNumber).toString();
        }
        ex2 = result;
        res = firstNumber.toString() + " " + opt + " " + secondNumber.toString() + " = " + result;
        ex1 = "";
        disResult = "";
      } 
      else {
        disResult += btnName;
        ex1 = disResult;
        if(ex2 == result){
          ex2 = "";
        }
      }
    });
  }

  Widget btn(String btnName) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.2),
        highlightColor: Colors.blue,
        splashColor: Colors.teal,
        onPressed: () => backEnd(btnName),
        child: Text(
          "$btnName",
          style: TextStyle(
            fontSize: 25.2,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculator",
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(24),
              child: Text(
                "$res",
                style: TextStyle(
                  fontSize: 25.2,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Text(
                "$ex2",
                style: TextStyle(
                  fontSize: 25.2,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Text(
                "$ex1",
                style: TextStyle(
                  fontSize: 25.2,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                btn("7"),
                btn("8"),
                btn("9"),
                btn("/"),
              ],
            ),
            Row(
              children: <Widget>[
                btn("4"),
                btn("5"),
                btn("6"),
                btn("x"),
              ],
            ),
            Row(
              children: <Widget>[
                btn("1"),
                btn("2"),
                btn("3"),
                btn("-"),
              ],
            ),
            Row(
              children: <Widget>[
                btn("C"),
                btn("0"),
                btn("="),
                btn("+"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
