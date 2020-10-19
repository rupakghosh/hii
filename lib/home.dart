import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:myapp/sic_main.dart';
import 'annuity_main.dart';
import 'cic_main.dart';
import 'ji.dart';
import 'jic2.dart';
import 'lease.dart';
import 'lease_main.dart';


class FinalHomePage2 extends StatelessWidget {

  static final descTextStyle = TextStyle(
    color: Colors.black,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 18,
    height: 2,
  );

  final iconSet3 = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container()
  );

  final iconSet4 = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container()
  );

  void push1(){

  }

  /* void _resetCounter() {
    setState((){
      _counter=0;
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apni Bachat'),
        centerTitle: true,

      ),

      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DefaultTextStyle.merge(
                style: descTextStyle,
                child:  Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.account_balance,
                              color: Colors.lightBlue,
                              semanticLabel: "Compound Interest",
                            ),
                            onPressed: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => cicmain()))
                            },
                          ),
                          Text('Compound Interest'),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.group,
                              color: Colors.lightBlue,
                              semanticLabel: "Simple Interest",
                            ),
                            onPressed: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => sicmain()))
                            },
                          ),
                          Text('Simple Interest')
                        ],
                      )
                    ],
                  ),
                ),
              ),
              DefaultTextStyle.merge(
                style: descTextStyle,
                child:  Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.add_shopping_cart,
                              color: Colors.lightBlue,
                              semanticLabel: "Leasing",
                            ),
                            onPressed: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => leasemain()))
                            },
                          ),
                          Text('Leasing')
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.portrait,
                              color: Colors.lightBlue,
                              semanticLabel: "Annuity",
                            ),
                            onPressed: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>annuitymain()))
                            },
                          ),
                          Text('Annuity')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      /*drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  child: Text('Drawer Header'),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  )
              ),
              ListTile(
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> SettingsWidget()),
                    );
                  }
              ),
              ListTile(
                title: Text('Log Out'),
                onTap: ()=> {
                   SystemChannels.platform.invokeMethod('SystemNavigator.pop')
                },
              )
            ],
          ),
        ),*/// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
