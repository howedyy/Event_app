import 'package:event_app/models/catagory_model.dart';
import 'package:flutter/material.dart';

class EventModel{
  CategoryModel category ;
  String title;
  String description;
  DateTime dateTime;
  TimeOfDay timeOfDay;
  EventModel({
    required this.title,
    required this.category,
    required this.description,
    required this.dateTime,
    required this.timeOfDay

});

}