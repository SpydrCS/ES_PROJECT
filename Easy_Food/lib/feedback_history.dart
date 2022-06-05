import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackHistory extends StatefulWidget {
  const FeedbackHistory({Key? key}) : super(key: key);

  @override
  State<FeedbackHistory> createState() => _FeedbackHistory();
}


class _FeedbackHistory extends State<FeedbackHistory> {
  final database = FirebaseDatabase.instance.ref();
  late StreamSubscription _dailySpecialStream;
  final List<Widget> _feedbacksList = [];
  int fbLength = 0;
  bool dataWasLoaded = false;

  _getFeedbacksFromDatabase(){
    final feedbacks = database.child('feedbacks/');
    _dailySpecialStream = feedbacks.onValue.listen((event) {
      fbLength = event.snapshot.children.length;

      for (DataSnapshot child in event.snapshot.children) {
        String menu  = child.child('menu/').value.toString();
        String text  = child.child('text/').value.toString();
        int stars    = int.parse(child.child('stars/').value.toString());
        String date  = child.child('date/').value.toString();
        String hour  = child.child('hour/').value.toString();

        // todo
        _feedbacksList.add(
            Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(10),
                width: 400,
                decoration: BoxDecoration(
                  color: stars > 3 ? Colors.green.withOpacity(0.1) : 
                  stars <3? Colors.red.withOpacity(0.1) : Colors.blueAccent.withOpacity(0.1),
                    border: Border.all(
                        color: Colors.blueAccent,
                    )
                ),
                child : Column(
                    children: <Widget>[
                      // DATE and HOUR ----------------------------------------V
                      Text("$date   $hour"),
                      // STARS ------------------------------------------------V
                      RatingBarIndicator(
                        rating: stars as double,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                      // MENU -------------------------------------------------V
                      Text("Menu: $menu"),
                      // FEEDBACK TEXT ----------------------------------------V
                      Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(10),
                        width: 500,
                        child : Text(text)
                      )
                    ]
                )
            )
        );
      }

      setState(() {
        dataWasLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if(!dataWasLoaded) _getFeedbacksFromDatabase();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Feedbacks"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              _dailySpecialStream.cancel();
              Navigator.pop(context);
            },
          ),
        ),
      body : ListView.builder(
        itemCount: fbLength,
        itemBuilder: (context, index){
          return ListTile(
            title: _feedbacksList[fbLength -1 - index],
          );
        }

      )
    );
  }
}




