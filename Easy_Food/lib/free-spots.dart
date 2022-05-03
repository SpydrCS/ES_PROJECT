import 'package:flutter/material.dart';

String freePlaces() {
  return "10";
}

String maxCapacity() { //TODO: check what real max capacity is
  return "300";
}

class FreeSpots extends StatelessWidget{
  const FreeSpots({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('EasyFood'),
      ),
      body: Center(
        child: Container (
          child: Text(
              'Available seats: ' + freePlaces() + '/' + maxCapacity(),
          ),
        ),
      ),
    );
  }
}