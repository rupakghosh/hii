import 'package:flutter/material.dart';

import 'jic2.dart';



class cicmain extends StatefulWidget {
  cicmain({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _cicmainState createState() => _cicmainState();
}
class _cicmainState extends State<cicmain>
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
              '   ~Interest calculated basd on INITIAL PRINCIPAL & ACCUMULATED INTEREST frpm previous periods',
              style: TextStyle(fontWeight: FontWeight.w900, fontStyle: FontStyle.normal, color: Colors.blueGrey.withOpacity(0.9), height: 2, fontSize: 18),
            ),
            new Text(
              '\n   ~Interest can be calculaetd on any frequency schedule(Compounded per year - Daily(365/Yr), Weekly(52/Yr), Bi-Weekly(26/Yr), Semi-Moonthly(24/Yr), Monthly(12/Yr), Bi-Monthly(6/Yr), Quarterly(4/Yr), Semi-Annulay(2/Yr), Annulay(1/Yr)',
              style: TextStyle(fontWeight: FontWeight.w900, fontStyle: FontStyle.normal, color: Colors.blueGrey.withOpacity(0.9), height: 2, fontSize: 18),
            ),
            new Text(
              '\n   ~Beneficial than Simple Interest (Higher Compunding period, greater is the Interest amount over Investement',
              style: TextStyle(fontWeight: FontWeight.w900, fontStyle: FontStyle.normal, color: Colors.blueGrey.withOpacity(0.9), height: 2, fontSize: 18),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton
        (
        onPressed: () =>
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>calcii ()))
        },
        child: Icon(Icons.add_box),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
