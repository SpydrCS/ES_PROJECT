import 'dart:html';

import 'package:flutter/material.dart';
import 'nav.dart';
import 'working-hours.dart';
import 'menu.dart';
import 'html.dart';
import 'package:location/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyFood',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomePage(title: 'EasyFood', maxCapacity: "324",),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title, required this.maxCapacity}) : super(key: key);

  final String title;
  final String maxCapacity;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _isVisible = false;
  var _isVisibleError = false;
  var _errorString = "";
  int freeSpots = 0;
  String Spots = "";
  Location location = Location();


  _addEater() {
    setState(() {
      freeSpots++;
      Spots = freeSpots.toString();
    });
  }

  _startRecording() {
    setState(() {
      _isVisible = true;
    });
  }

  _stopRecording() {
    setState(() {
      _isVisible = false;
    });
  }

  bool isCanteenOpen(){
    // TODO implement Canteen API to get canteen hours information and tedermine if the canteen is open
    DateTime date = DateTime.now();
    print(" Day: ${date.day}, Hour: ${date.hour}:${date.minute}");
    return true;
  }

  Future<bool> isGPSActivated() async {
    location = Location();
    var _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }

    var _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied){
      _permissionGranted = await location.requestPermission();
    }
    if (_permissionGranted != PermissionStatus.granted) {
      return false;
    }
    return true;
  }

  Future<bool> isInsideTheCanteen() async{
    var _locationData = await location.getLocation();
    // Canteen Area : 41.176818, -8.596012   ( up left point )
    //                41.175912, -8.594982   ( down right point )
    // https://www.google.pt/maps/place/Cantina+Faculdade+De+Engenharia+Da+Universidade+Do+Porto/@41.1770209,-8.5972127,17.8z/data=!4m13!1m7!3m6!1s0x0:0x3c6ee07e6025a87c!2zNDHCsDEwJzM4LjUiTiA4wrAzNSc0My4xIlc!3b1!8m2!3d41.1773616!4d-8.5953062!3m4!1s0xd24646a0a78494f:0xd02370fe6e90ce06!8m2!3d41.1762815!4d-8.5953035
    if(_locationData.latitude! < 41.176818 && _locationData.latitude! > 41.175912 &&
      _locationData.longitude! > -8.596012 && _locationData.longitude! < -8.594982   ){
      return true;
    }else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text('EasyFood'),
        ),
        body: ButtonBar(
          buttonPadding:EdgeInsets.symmetric(horizontal: 30,vertical: 10),
          buttonMinWidth: 500,
          overflowDirection: VerticalDirection.down,
          overflowButtonSpacing: 50,
          alignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("Horário"),
              textColor: Colors.white,
              color: Colors.indigo,
              padding: EdgeInsets.all(50),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkingHours()),);
              },
            ),
            RaisedButton(
              child: Text("Menu"),
              textColor: Colors.white,
              color: Colors.indigo,
              padding: EdgeInsets.all(50),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu()),);
              },
            ),
            RaisedButton(
              child: Text("Latest Feedbacks"),
              textColor: Colors.white,
              color: Colors.indigo,
              padding: EdgeInsets.all(50),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => WebScraperApp()),);
              },
            ),
            Visibility(
              visible: _isVisible,
              child: Text(
                'Assentos ocupados: ' + Spots + '/324', // TODO: somehow get the maxCapacity from MyHomePage class
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            RaisedButton(
              child: Text("Check-in"),
              textColor: Colors.black,
              color: Colors.indigo.shade300,
              padding: const EdgeInsets.all(20),
              onPressed: () async {
                if(!isCanteenOpen()){
                  setState(() {
                    _isVisibleError = true;
                    _errorString = "The canteen is closed";
                  });
                }else if(!await isGPSActivated()){
                  setState(() {
                    _isVisibleError = true;
                    _errorString = "Location services disabled";
                  });
                }else if(!await isInsideTheCanteen()){
                  setState(() {
                    _isVisibleError = true;
                    _errorString = "Please go to the canteen area to do the check-in";
                  });
                }else{
                  _isVisibleError = false;
                  _addEater();
                  _startRecording();
                }
              },
            ),
            Visibility(
              visible: _isVisibleError,
              child: Text(
                _errorString, // Canteen is not in working hours
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        )
    );
  }
}