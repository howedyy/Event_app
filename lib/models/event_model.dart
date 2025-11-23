import 'package:event_app/models/category_model.dart';
import 'package:flutter/material.dart';

class EventModel{
  String id;
  CategoryModel category ;
  String title;
  String description;
  DateTime dateTime;
  EventModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.dateTime,

});
  EventModel.fromJson(Map<String,dynamic> json,BuildContext context) :
        this(
      id: json["id"],
      category: CategoryModel.getCategories(
          context,
      ).firstWhere((category)=> category.id == json["categoryId"]),
      title: json["title"],
      description: json["description"],
      dateTime: json["dateTime"]
  );




 Map<String, dynamic> toJson()=>{
   "id":id,
   "categoryId":category.id,
   "title":title,
   "description":description,
   "dateTime":dateTime,
 };
}