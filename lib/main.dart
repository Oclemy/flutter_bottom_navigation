import 'package:flutter/material.dart';


class Homepage extends StatefulWidget {
  @override
  createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('BottomNav Grids'),
      ),
      body: HomeBody(),
      bottomNavigationBar: MyBottomNavBar(
        index: index,
        callback: (newIndex) => setState(
              () => this.index = newIndex,
            ),
      ),
    );
  }
}

//This represents the Body. We show GridView in Body
class HomeBody extends StatelessWidget {

  //Create and Return GridView filled with our data
  Widget createGridView(BuildContext context) {
    var spacecrafts = ["James Web","Enterprise","Hubble","Kepler","Juno","Casini","Columbia","Challenger","Mariner","Pioneer","Huygens","Galileo","Dawn","Star Dust","Apollo","Spitzer","WMAP","Swift","Atlantis"];
    spacecrafts.shuffle();
    return new GridView.builder(
      itemCount: spacecrafts.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(
          child: new Card(
            elevation: 5.0,
            child: new Container(
              alignment: Alignment.centerLeft,
              margin: new EdgeInsets.only(top: 10.0, bottom: 10.0,left: 10.0),
              child: new Text(spacecrafts[index]),
            ),
          ),
    );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: createGridView(context),
      ),
    );
  }
}

class MyBottomNavBar extends StatelessWidget {
  MyBottomNavBar({this.index, this.callback});

  final int index;
  final Function(int) callback;

  @override
  Widget build(BuildContext context) {
    /// BottomNavigationBar is automatically set to type 'fixed'
    /// when there are three of less items
    return BottomNavigationBar(
      currentIndex: index,
      onTap: callback,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Plasma'),
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.usb),
          title: Text('Laser'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.threed_rotation),
          title: Text('Warp'),
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Bottom Navigation',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: Homepage());
  }
}

void main() => runApp(MyApp());
