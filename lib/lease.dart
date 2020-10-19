import 'package:flutter/material.dart';
import 'dart:math';

import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';


class calciil extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return calciilstate();
  }
}

///Crafting the UI
class calciilstate extends State<calciil> {
  final _formKey = GlobalKey<FormState>();
  final _padding = EdgeInsets.all(18.0);

  var selectedItem = ' ';
  var principalController = TextEditingController();
  var interestController = TextEditingController();
  var npmController = TextEditingController();
  var advController = TextEditingController();
  var rsdController = TextEditingController();

  var displayResullt = '';
  List<String> displ=[];



  @override
  void initState()
  {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lease Calculator',
        ),

      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
              height: 35.0,
            ),
            Text('Enter Required Details: ',
                style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black.withOpacity(0.7), height: 2, fontSize: 18)
            ),

            getAmountField(
              'Enter in Amount',
              'Lease Amount(PV)',
              Icons.attach_money,
              principalController,
              _padding,
            ),
            getAmountField(
              'Enter in Amount',
              'residual Value(FV)',
              Icons.attach_money,
              rsdController,
              _padding,
            ),
            getAmountField(
              'Enter in Years',
              'Term(N)',
              Icons.attach_money,
              npmController,
              _padding,
            ),
            getAmountField(
              'Enter in Percentage (%)',
              'Interest Rate (R)',
              Icons.payment,
              interestController,
              _padding,
            ),

            getAmountField(
              'Enter in months',
              'Advance Payments',
              Icons.attach_money,
              advController,
              _padding,
            ),


            Padding(
              padding: _padding,
              child: Row(
                children: <Widget>[
                  getCalcButton('Reset Values', Colors.lightGreen, reset),
                  Container(
                    width: 10.0,
                  ),
                  getCalcButton('Calculate PMT', Colors.orangeAccent, calculate),
                  Container(
                    width: 10.0,
                  ),

                ],
              ),
            ),
            Padding(
              padding: _padding,
              child: Center(
                child: Text(
                  displayResullt,
                  style: TextStyle(fontWeight: FontWeight.w800, fontStyle: FontStyle.italic, color: Colors.brown.withOpacity(0.9), height: 2, fontSize: 18),
                ),
              ),
            ),
          ],
        ),

      ),


    );
  }

  /// Crafting the TextFormField
  Widget getAmountField(String hintText, String labelText, IconData iconOfField,
      TextEditingController textController, EdgeInsets wrapp)
  {
    return Container(
      child: Padding(
        padding: wrapp,
        child: TextFormField
          (
          validator: (String input) {
            if (input.isEmpty) return 'Invalid Entry!!!';

          },
          controller: textController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            errorStyle: TextStyle
              (
              color: Colors.red,
              fontSize: 12.0,
            ),
            prefixIcon: Icon(iconOfField),
            hintText: hintText,
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
      ),
    );
  }

  ///Crafting the Button
  Widget getCalcButton(
      String buttonName, Color buttonColor, Function buttonFunc) {
    return Expanded(
      child: RaisedButton(
        child: Text(
          buttonName,
        ),
        color: buttonColor,
        onPressed: () => setState
          (
              () {
            if (_formKey.currentState.validate())
              this.displayResullt = buttonFunc();
          },
        ),
      ),
    );
  }


  /// User Selection Method
  void selectMethod(String selectedItem) {
    setState(() => this.selectedItem = selectedItem);
  }

  /// Button Calculate Method
  String calculate() {
    var pv = double.parse(principalController.text);
    var fv = double.parse(rsdController.text);
    var advance = double.parse(advController.text);
    var interest = double.parse(interestController.text);
    var npm = double.parse(npmController.text);
    var npm2= (npm*12).toInt();


    var interest_modified= (interest)/1200;

    var hi = fv/pow((1+interest_modified),npm2);
    var hi2= pv-hi;
    var hi3= npm2-advance;
    var hi4= 1-(1/pow((1+interest_modified),hi3));
    var hi5 = (hi4/interest_modified) + advance;
    var finalpmt = hi2/hi5;
    var finalpmt2=double.parse((finalpmt).toStringAsFixed(2));
    var ty= double.parse((finalpmt2*advance).toStringAsFixed(2));


    var result = 'Monthly Payment Amount: $finalpmt2 \n Immediate check(as per advance payment):$ty ';


    return result;


  }


  ///Button Reset Method
  String reset() {
    principalController.text = '';
    interestController.text = '';
    npmController.text = '';
    displayResullt = '';


    return '';
  }
}