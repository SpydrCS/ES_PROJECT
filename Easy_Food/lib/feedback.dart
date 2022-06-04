

import 'package:firebase_database/firebase_database.dart';

class FeedbackEF{
  String? menu;
  String? text;
  int? stars;
  String? date;
  String? hour;

  FeedbackEF(this.menu, this.text, this.stars){
    DateTime datetime = DateTime.now();
    date = "${datetime.day}/${datetime.month}/${datetime.year}";
    hour = "${datetime.hour}:${datetime.minute}";
  }

  bool pushToDatabase(DatabaseReference _db){
    final feedbacks = _db.child('feedbacks/');
    feedbacks.push().set(toJson());
    return false;
  }

  Map<String, dynamic> toJson() {
    return{
      'menu': menu,
      'text': text,
      'stars': stars,
      'date': date,
      'hour': hour
    };
  }
}