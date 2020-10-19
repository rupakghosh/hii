import 'package:flutter/material.dart';

import 'ji.dart';


class sicmain extends StatefulWidget {
  sicmain({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _sicmainState createState() => _sicmainState();
}
class _sicmainState extends State<sicmain>
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
              '   ~Interest calculated on the Principal portion of the original contribuition to savings account',
              style: TextStyle(fontWeight: FontWeight.w900, fontStyle: FontStyle.normal, color: Colors.blueGrey.withOpacity(0.9), height: 2, fontSize: 18),
            ),
            new Text(
              '\n   ~Account holder will only gain interest on the principal',
              style: TextStyle(fontWeight: FontWeight.w900, fontStyle: FontStyle.normal, color: Colors.blueGrey.withOpacity(0.9), height: 2, fontSize: 18),
            ),
            new Text(
              '\n   ~Reffered to as Total payable or gainable amount over a fixed principal after certain time att the specified interest rate',
              style: TextStyle(fontWeight: FontWeight.w900, fontStyle: FontStyle.normal, color: Colors.blueGrey.withOpacity(0.9), height: 2, fontSize: 18),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton
        (
        onPressed: () =>
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>calcii2 ()))
        },
        child: Icon(Icons.add_box),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}