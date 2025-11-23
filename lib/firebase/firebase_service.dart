import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/models/login_request.dart';
import 'package:event_app/models/register_request.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../models/event_model.dart';
import '../models/user_model.dart';

class FirebaseService{
  static Future<UserCredential> register(RegisterRequest request)async{
   UserCredential userCredential= await  FirebaseAuth.instance.createUserWithEmailAndPassword(
       email: request.email,
       password: request.password);
   return userCredential;
  }

  static Future<UserCredential> login(LoginRequest request)async{
  UserCredential userCredential = await FirebaseAuth.instance
      .signInWithEmailAndPassword(
      email: request.email,
      password: request.password
  );
  return userCredential;
  }

// static Future<void> addUserToFireStore(UserModel user){
//    FirebaseFirestore db =
//        FirebaseFirestore.instance;
//    CollectionReference<Map<String, dynamic>> usersCollection =
//    db.collection(
//        "Users");
//    DocumentReference<Map<String, dynamic>> userDocument = usersCollection.doc(user.id);
//   return userDocument.set(user.toJson());
//   }

  static CollectionReference<UserModel> _getUserCollection(){
    FirebaseFirestore db =FirebaseFirestore.instance;
    CollectionReference<UserModel> usersCollection =  db.collection(UserModel.collectionName).withConverter<UserModel>(
        fromFirestore: (snapshot,_)=>UserModel.fromJson(snapshot.data()!),
        toFirestore: (user, _)=>user.toJson()
    );
    return usersCollection;
  }


  static Future<void>addUserToFireStore(UserModel user){
   CollectionReference<UserModel> usersCollection = _getUserCollection();
   DocumentReference<UserModel> userDocument = usersCollection.doc(user.id);
   return userDocument.set(user);
  } 



  // static Future<UserModel> getUserFromFireStore(String uid) async {
  //   FirebaseFirestore db = FirebaseFirestore.instance;
  //   CollectionReference<Map<String, dynamic>> usersCollection = db.collection(
  //       "Users"
  //   );
  //   DocumentReference<Map<String, dynamic>> userDoc = usersCollection.doc(uid);
  //   DocumentSnapshot<Map<String,dynamic>> documentSnapshot =await userDoc
  //       .get();
  //   var json = documentSnapshot.data();
  //   return UserModel.fromJson(json!);
  // }


static Future<UserModel?>getUserFromFireStore(String uid)async{
   FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference<UserModel> usersCollection = _getUserCollection();
  DocumentReference<UserModel> userDocument = usersCollection.doc(uid);
  DocumentSnapshot<UserModel> documentSnapshot = await userDocument.get();
  return documentSnapshot.data();
}

  static CollectionReference<EventModel> _getEventsCollection(
      BuildContext context,
      ) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<EventModel> eventsCollection = db
        .collection("Events")
        .withConverter<EventModel>(
      fromFirestore: (snapshot, _) =>
          EventModel.fromJson(snapshot.data()!, context),
      toFirestore: (event, _) => event.toJson(),
    );
    return eventsCollection;
  }

  static Future<void> addEventToFireStore(
      EventModel event,
      BuildContext context,
      ) {
    CollectionReference<EventModel> eventsCollection = _getEventsCollection(
      context,
    );
    DocumentReference<EventModel> eventDocument = eventsCollection.doc();
    event.id = eventDocument.id;
    return eventDocument.set(event);
  }

}