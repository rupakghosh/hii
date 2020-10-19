import 'package:flutter/material.dart';





import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'lease.dart';




class leasemain extends StatefulWidget {
  leasemain({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _leasemainState createState() => _leasemainState();
}
class _leasemainState extends State<leasemain>
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
              '   ~Lease amount - Value of the asset being leased( PV of the future payments on th lease)',
              style: TextStyle(fontWeight: FontWeight.w900, fontStyle: FontStyle.normal, color: Colors.blueGrey.withOpacity(0.9), height: 2, fontSize: 15),
            ),
            new Text(
              '\n   ~Assumed value of the asset at the end of the life of the lease',
              style: TextStyle(fontWeight: FontWeight.w900, fontStyle: FontStyle.normal, color: Colors.blueGrey.withOpacity(0.9), height: 2, fontSize: 15),
            ),
            new Text(
              '\n   ~Advance Payments - The lease terms call for a number of payments to be paid in advance, when the lease is signed ',
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
              label: "Lease Calculator",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => calciil()),
                );
              }
          ),


        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}