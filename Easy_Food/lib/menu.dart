import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wnetworking/wnetworking.dart';

import 'mondayMenu.dart';
import 'tuesdayMenu.dart';
import 'wednesdayMenu.dart';
import 'thursdayMenu.dart';
import 'fridayMenu.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _Menu();
}

/*
class MenuInfo {
  final String data, carne, peixe, vegetariano;
  MenuInfo(this.data, this.carne, this.peixe, this.vegetariano);
}
*/

class User {
  final String name, username, email;
  User(this.email, this.name, this.username);
}

class _Menu extends State<Menu> {

  void showMondayMenu() {
    setState(() {
      print('MENU SEGUNDA');
      Route route= MaterialPageRoute(builder: (bc) => const MondayMenu());
      Navigator.of(context).push(route);
    });
  }
  void showTuesdayMenu() {
    setState(() {
      print('MENU TERÇA');
      Route route= MaterialPageRoute(builder: (bc) => const TuesdayMenu());
      Navigator.of(context).push(route);
    });
  }
  void showWednesdayMenu() {
    setState(() {
      print('MENU QUARTA');
      Route route= MaterialPageRoute(builder: (bc) => const WednesdayMenu());
      Navigator.of(context).push(route);
    });
  }
  void showThursdayMenu() {
    setState(() {
      print('MENU QUINTA');
      Route route= MaterialPageRoute(builder: (bc) => const ThursdayMenu());
      Navigator.of(context).push(route);
    });
  }
  void showFridayMenu() {
    setState(() {
      print('MENU SEXTA');
      Route route= MaterialPageRoute(builder: (bc) => const FridayMenu());
      Navigator.of(context).push(route);
    });
  }

  Future getUserData() async {
    var response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));
    //var response = await http.get(Uri.https('sigarra.up.pt', 'feup/pt/cantina.ementashow'),headers:{'Content-Type': 'application/json'});
    var jsonData = jsonDecode(response.body);
    //print(jsonData);

    List<User> menus = [];

    for(var u in jsonData) {
      User menuInfo = User(u['email'], u['name'], u['username']);
      menus.add(menuInfo);
      //print(menuInfo);
    }
    print(menus.length);
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 50),
        minimumSize: const Size(300, 50)
    );
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
        title: Text("Menu semanal"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 30),
            ElevatedButton(
              style: style,
              onPressed: () {showMondayMenu();},
              child: const Text('Segunda'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: style,
              onPressed: () {showTuesdayMenu();},
              child: const Text('Terça'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: style,
              onPressed: () {showWednesdayMenu();},
              child: const Text('Quarta'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: style,
              onPressed: () {showThursdayMenu();},
              child: const Text('Quinta'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: style,
              onPressed: () {showFridayMenu();},
              child: const Text('Sexta'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: style,
              onPressed: () {
                getUserData();
              },
              child: const Text('ShowLen (WIP)'),
            ),
          ],
        ),
      ),
    );
  }
}
