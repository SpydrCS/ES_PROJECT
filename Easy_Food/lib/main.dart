import 'package:flutter/material.dart';
import 'nav.dart';
import 'working-hours.dart';
import 'menu.dart';

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
  const MyHomePage({Key? key, required this.title, required this.maxCapacity}) : super(key: key);

  final String title;
  final String maxCapacity;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _isVisible = false;
  int freeSpots = 0;
  String Spots = "";

  _addEater() {
    this.setState(() {
      freeSpots++;
      Spots = freeSpots.toString();
    });
  }

  _startRecording() {
    this.setState(() {
      _isVisible = true;
    });
  }

  _stopRecording() {
    this.setState(() {
      _isVisible = false;
    });
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
              onPressed: (){},
            ),
            RaisedButton(
              child: Text("Check-in"),
              textColor: Colors.black,
              color: Colors.indigo.shade300,
              padding: EdgeInsets.all(20),
              onPressed: () {
                _addEater();
                _startRecording();
              },
            ),
            Visibility(
              visible: _isVisible,
              child: Text(
                'Assentos ocupados: ' + Spots + '/324', // TODO: somehow get the maxCapacity from MyHomePage class
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        )
    );
  }
}