import 'package:flutter/material.dart';

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

class WorkingHours extends StatelessWidget{
  const WorkingHours({Key? key}) : super(key:key);

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}