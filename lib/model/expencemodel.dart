//import "dart:ffi";

import "package:uuid/uuid.dart"; // to automatically store unique value for id

const uuid=Uuid();
enum Category{ food, travel, leisure, work}


class Expencemodel {
  Expencemodel( {
    
    required this.title,
    required this.amount,
    required this.date,
    required this .category
  }): id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}