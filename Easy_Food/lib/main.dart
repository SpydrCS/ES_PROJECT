import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String getStartLunch() { // TODO: get numbers from website
  return "11:30";
}

String getEndLunch() { // TODO: get numbers from website
  return "14:00";
}

String getStartDinner() { // TODO: get numbers from website
  return "18:30";
}

String getEndDinner() { // TODO: get numbers from website
  return "20:30";
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'EasyFood'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
        title: Text(widget.title),
      ),
      body: Center(
        child: Container (
          margin: const EdgeInsets.only(top: 100),
          child: Column(
            children: <Widget>[
              const Text(
                'Horário de Funcionamento',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              const Text(
                '(Segunda a sexta)',
                style: TextStyle(
                  fontSize: 15,
                )
              ),
              const SizedBox(height: 100),
              Text(
                'Almoço: ' + getStartLunch() + ' - ' + getEndLunch(),
                style: const TextStyle(
                  fontSize: 20
                )
              ),
              const SizedBox(height: 20),
              Text(
                'Jantar: ' + getStartDinner() + ' - ' + getEndDinner(),
                style: const TextStyle(
                  fontSize: 20
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
