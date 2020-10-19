import 'package:flutter/material.dart';





import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'pva.dart';
import 'fva.dart';



class annuitymain extends StatefulWidget {
  annuitymain({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _annuitymainState createState() => _annuitymainState();
}
class _annuitymainState extends State<annuitymain>
{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '   ~In Ordinary Annuity payments are made at the end pof each period ',
              style: TextStyle(fontWeight: FontWeight.w900, fontStyle: FontStyle.normal, color: Colors.blueGrey.withOpacity(0.9), height: 2, fontSize: 15),
            ),
            new Text(
              '\n   ~Based on th econcept of Time Value of Money ( Any given sum is worth more now than it will be in the future',
              style: TextStyle(fontWeight: FontWeight.w900, fontStyle: FontStyle.normal, color: Colors.blueGrey.withOpacity(0.9), height: 2, fontSize: 15),
            ),
            new Text(
              '\n   ~Future Value of an annuity is total value of payments at a specific point in time ',
              style: TextStyle(fontWeight: FontWeight.w900, fontStyle: FontStyle.normal, color: Colors.blueGrey.withOpacity(0.9), height: 2, fontSize: 15),
            ),
            new Text(
              '\n   ~Present Value deals with the money that is required now to produce future payments',
              style: TextStyle(fontWeight: FontWeight.w900, fontStyle: FontStyle.normal, color: Colors.blueGrey.withOpacity(0.9), height: 2, fontSize: 15),
            ),

          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.list_view,
        children: [
          SpeedDialChild(
              child: Icon(Icons.attach_money),
              label: "PVannuity",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => calciipva()),
                );
              }
          ),
          SpeedDialChild(
              child: Icon(Icons.attach_money),
              label: "FVannuity",
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => calciifva()),
                )
              }
          ),

        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
