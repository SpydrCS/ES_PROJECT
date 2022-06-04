import 'dart:async';
import 'dart:html';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'nav.dart';
import 'working-hours.dart';
import 'menu.dart';
import 'html.dart';
import 'feedback-view.dart';
import 'package:location/location.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:
    const FirebaseOptions(
      apiKey: "AIzaSyC9ZSK2bN63MtCtI3-Ck7vZshFBmEp4j_U", // Your apiKey
      appId: "easyfood-03", // Your appId
      databaseURL: "https://easyfood-03-default-rtdb.europe-west1.firebasedatabase.app",
      messagingSenderId: "953920604149", // Your messagingSenderId
      projectId: "easyfood-03", // Your projectId
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp>_fbApp = Firebase.initializeApp();
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'EasyFood',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: FutureBuilder (
        future: _fbApp,
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            print('You have an error! ${snapshot.error.toString()}');
            return Text('Something went wrong!');
          } else if (snapshot.hasData) {
            return  MyHomePage(title: 'EasyFood', maxCapacity: "324");
          } else {
            return const Center (
              child: CircularProgressIndicator(),
            );
          }

        }
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.maxCapacity}) : super(key: key);

  final String title;
  final String maxCapacity;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _isVisible = false;
  var _isVisibleError = false;
  var _errorString = "";
  var _checkType = "Check-in";
  late Timer timer;
  var _timerCount = 0;
  int freeSpots = 0;
  String Spots = "12";
  Location location = Location();
  final database = FirebaseDatabase.instance.ref();
  var _people = 0;

  _checkIn(){
    setState(() {
      database.update({'people': _people + 1});
      _isVisibleError = false;
      _checkType = "Check-out";
      _startTimer();
      _startRecording();
    });
  }

  _checkOut(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const FeedbackDialog()),);
    setState((){
      database.update({'people': _people - 1});
      _checkType = "Check-in";
      _stopTimer();
    });
  }

  _startTimer(){
    _timerCount=0;
    timer = Timer.periodic( const Duration(minutes: 1), (timer) {
      _timerCount++;
      if(_timerCount >= 30){ // Automatic check-out after 30 minutes
        _checkOut();
      }
    });
  }

  _stopTimer(){
    timer.cancel();
  }

  _startRecording() async {
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
    //print(" Day: ${date.day}, Hour: ${date.hour}:${date.minute}");
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
    final people = database.child('people/');
    people.onValue.listen((event) {
      _people = event.snapshot.value as int;
      setState(() {});
      print("hello");
    });

    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: const Text('EasyFood'),
        ),
        body: ButtonBar(
          buttonPadding:const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
          buttonMinWidth: 500,
          overflowDirection: VerticalDirection.down,
          overflowButtonSpacing: 50,
          alignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: const Text("Horário"),
              textColor: Colors.white,
              color: Colors.indigo,
              padding: const EdgeInsets.all(50),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkingHours()),);
              },
            ),
            RaisedButton(
              child: const Text("Menu"),
              textColor: Colors.white,
              color: Colors.indigo,
              padding: const EdgeInsets.all(50),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu()),);
              },
            ),
            RaisedButton(
              child: const Text("Latest Feedbacks"),
              textColor: Colors.white,
              color: Colors.indigo,
              padding: const EdgeInsets.all(50),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => WebScraperApp()),);
              },
            ),
            Visibility(
              visible: isCanteenOpen() ,
              child: Text(
                'Assentos ocupados: $_people /324', // TODO: somehow get the maxCapacity from MyHomePage class
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            RaisedButton(
              child: Text(_checkType),
              textColor: Colors.black,
              color: _checkType=="Check-out" ? Colors.red : Colors.green,
              padding: const EdgeInsets.all(20),
              onPressed: () async {
                if(_checkType == "Check-in") {
                  if (!isCanteenOpen()) {
                    setState(() {
                      _isVisibleError = true;
                      _errorString = "The canteen is closed";
                    });
                  } else if (!await isGPSActivated()) {
                    setState(() {
                      _isVisibleError = true;
                      _errorString = "Location services disabled";
                    });
                  } else if (await isInsideTheCanteen()) {
                    setState(() {
                      _isVisibleError = true;
                      _errorString = "Please go to the canteen area to do the check-in";
                    });
                  } else {
                    _checkIn();
                  }
                } else{
                  _checkOut();
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