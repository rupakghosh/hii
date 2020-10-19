import 'package:flutter/material.dart';
import 'dart:math';

import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';


class Datac {
  double e1;
  double e2;
  double e3;
  double e4;
  double e5;
  double e6;
  double e7;
  double e8;
  double e9;
  double e10;
  double e11;
  double e12;

  Datac({this.e1,this.e2,this.e3,this.e4,this.e5,this.e6,this.e7,this.e8,this.e9,this.e10,this.e11,this.e12});
}

class calciifva extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return calciifvastate();
  }
}

///Crafting the UI
class calciifvastate extends State<calciifva> {
  final _formKey = GlobalKey<FormState>();
  final _padding = EdgeInsets.all(18.0);

  var selectedItem = ' ';
  var principalController = TextEditingController();
  var interestController = TextEditingController();
  var npmController = TextEditingController();

  var displayResullt = '';
  List<String> displ=[];

  final datac1 = Datac(
      e1: 0,
      e2: 0,
      e3: 0,
      e4: 0,
      e5: 0,
      e6: 0,
      e7: 0,
      e8: 0,
      e9: 0,
      e10:0,
      e11:0,
      e12:0
  );



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
          'FVannuity Calculator',
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
              'Cash Flow per Period(C)',
              Icons.attach_money,
              principalController,
              _padding,
            ),
            getAmountField(
              'Enter numeric value',
              'Number of Payments/yrs(N)',
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




            Padding(
              padding: _padding,
              child: Row(
                children: <Widget>[
                  getCalcButton('Reset Values', Colors.lightGreen, reset),
                  Container(
                    width: 10.0,
                  ),
                  getCalcButton('Calculate FVA', Colors.orangeAccent, calculate),
                  Container(
                    width: 10.0,
                  ),
                  getCalcButton('Growth at Every Year(10 years)', Colors.orangeAccent, calculate2),
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


      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.list_view,
        children: [

          SpeedDialChild(
              child: Icon(Icons.insert_chart),
              label: "Bar Chart",
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePag(datac1:datac1)),
                )
              }
          ),
        ],
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
    var principal = double.parse(principalController.text);
    var interest = double.parse(interestController.text);
    var npm = double.parse(npmController.text);
    var npm2= npm.toInt();

    var interest_modified= (interest)/100;
    var hi = pow((1+interest_modified),npm);
    var hi2= (hi-1)/interest_modified;
    var fva = principal*hi2;
    var fva2= double.parse((fva).toStringAsFixed(2));



    var result = 'With $principal cash flow per period for $npm2 times(yrs) the Future Value(Ordinary Annuity) at $interest_modified rate is : $fva2 ';


    return result;


  }
  String calculate2() {
    var principal = double.parse(principalController.text);
    var interest = double.parse(interestController.text);

    var npm = double.parse(npmController.text);
    var npm2= npm.toInt();

    var interest_modified= (interest)/100;
    var hi = pow((1+interest_modified),npm);
    var hi2= (hi-1)/interest_modified;
    var fva = principal*hi2;
    var fva2= double.parse((fva).toStringAsFixed(2));
    var beg=principal;
    var i = (1+interest_modified);



    var end1 =double.parse((beg*pow(i,0)).toStringAsFixed(2));
    var end2 =double.parse((beg*pow(i,1)).toStringAsFixed(2));
    var end3 =double.parse((beg*pow(i,2)).toStringAsFixed(2));
    var end4 =double.parse((beg*pow(i,3)).toStringAsFixed(2));
    var end5 =double.parse((beg*pow(i,4)).toStringAsFixed(2));
    var end6 =double.parse((beg*pow(i,5)).toStringAsFixed(2));
    var end7 =double.parse((beg*pow(i,6)).toStringAsFixed(2));
    var end8 =double.parse((beg*pow(i,7)).toStringAsFixed(2));
    var end9 =double.parse((beg*pow(i,8)).toStringAsFixed(2));
    var end10 =double.parse((beg*pow(i,9)).toStringAsFixed(2));


    List<String> ab=['         End Balance\nM1 - $end1','M2 - $end2','M3 - $end3','M4 - $end4','M5 - $end5','M6 - $end6','M7 - $end7','M8 - $end8','M9 - $end9','M10 - $end10'];
    var strprincipal = ab.join("\n");
    datac1.e1 = end1;
    datac1.e2 = end2;
    datac1.e3 = end3;
    datac1.e4 = end4;
    datac1.e5 = end5;
    datac1.e6 = end6;
    datac1.e7 = end7;
    datac1.e8 = end8;
    datac1.e9 = end9;
    datac1.e10 = end10;

    return strprincipal;

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



class MyHomePag extends StatefulWidget {

  final Datac datac1;


  MyHomePag({this.datac1});

  @override
  _MyHomePagState createState() => _MyHomePagState(this.datac1);
}

class _MyHomePagState extends State<MyHomePag> {

  Datac datac1;


  _MyHomePagState(this.datac1);
  @override
  Widget build(BuildContext context) {

    var data=[
      bar("Y1",datac1.e1.toInt()),
      bar("Y2",datac1.e2.toInt()),
      bar("Y3",datac1.e3.toInt()),
      bar("Y4",datac1.e4.toInt()),
      bar("Y5",datac1.e5.toInt()),
      bar("Y6",datac1.e6.toInt()),
      bar("Y7",datac1.e7.toInt()),
      bar("Y8",datac1.e8.toInt()),
      bar("Y9",datac1.e9.toInt()),
      bar("y10",datac1.e10.toInt()),
    ];


    var series=[
      charts.Series(
          domainFn: (bar sales,_)=>sales.hi1,
          measureFn: (bar sales,_)=>sales.hi2,

          id:'HII',
          data: data

      )
    ];
    var chart=charts.BarChart(
      series, animate: true,animationDuration:  Duration(milliseconds: 4000),
    );
    return Scaffold(

      appBar: AppBar(
        title: Text("Bar Representation"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea
        (child: Padding(
        padding: const EdgeInsets.all(12.0),

        child: Column(
          children: <Widget>[Text("Rate at which Present Value Moves throughout 10 Years",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w800, color: Colors.brown)),
            SizedBox(height:600,child: chart),
          ],
        ),

      )


      ),

    );
  }
}

class bar {
  final String hi1;
  final int hi2;
  bar(this.hi1, this.hi2);
}

