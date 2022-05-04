import 'package:flutter/material.dart';
import 'canteenMenusSource.dart';

class ThursdayMenu extends StatelessWidget {
  const ThursdayMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 50),
        minimumSize: const Size(300, 50)
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("QUINTA"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(10),
              width: 400,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent)
              ),
              child: const Text('Menu de Carne:',
                style: TextStyle(fontSize: 30),),
            ),
            const SizedBox(height: 20),
            const Text('[       Carne       ]',
                style: TextStyle(fontSize: 25)
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(10),
              width: 400,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent)
              ),
              child: const Text('Menu de Peixe:',
                style: TextStyle(fontSize: 30),),
            ),
            const SizedBox(height: 20),
            const Text('[       Peixe       ]',
                style: TextStyle(fontSize: 25)
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(10),
              width: 400,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent)
              ),
              child: const Text('Menu vegetariano:',
                style: TextStyle(fontSize: 30),),
            ),
            const SizedBox(height: 20),
            const Text('[       Vegetariano       ]',
                style: TextStyle(fontSize: 25)
            ),
          ],
        ),
      ),
    );
  }
}


