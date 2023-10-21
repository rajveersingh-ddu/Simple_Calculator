

import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _currentInput = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operand = "";

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _currentInput = "";
        _num1 = 0;
        _num2 = 0;
        _operand = "";
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/") {
        _num1 = double.parse(_currentInput);
        _operand = buttonText;
        _currentInput = "";
      } else if (buttonText == "=") {
        _num2 = double.parse(_currentInput);
        if (_operand == "+") {
          _currentInput = (_num1 + _num2).toString();
        } else if (_operand == "-") {
          _currentInput = (_num1 - _num2).toString();
        } else if (_operand == "x") {
          _currentInput = (_num1 * _num2).toString();
        } else if (_operand == "/") {
          _currentInput = (_num1 / _num2).toString();
        }
        _num1 = 0;
        _num2 = 0;
        _operand = "";
      } else {
        _currentInput += buttonText;
      }
      _output = _currentInput;
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(

      child: Container(height: 80,
        width: 50,
        child: OutlinedButton(

          child: Text(buttonText,style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
          onPressed: () =>_buttonPressed(buttonText),
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white,
              backgroundColor: Colors.black,

              ),

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator App'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(24.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("9"),
                      buildButton("/")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton("x")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton("-")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("."),
                      buildButton("0"),
                      buildButton("C"),
                      buildButton("+")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("="),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
