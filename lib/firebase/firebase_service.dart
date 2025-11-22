import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/models/login_request.dart';
import 'package:event_app/models/register_request.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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

static Future<void> addUserToFireStore(UserModel user){
   FirebaseFirestore db =
       FirebaseFirestore.instance;
   CollectionReference<Map<String, dynamic>> usersCollection =
   db.collection(
       "Users");
   DocumentReference<Map<String, dynamic>> userDocument = usersCollection.doc(user.id);
  return userDocument.set({
     "id":user.id,
     "name":user.name,
    "email":user.email,
  });
  }

  static Future<UserModel> getUserFromFireStore(String uid) async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> usersCollection = db.collection(
        "Users"
    );
    DocumentReference<Map<String, dynamic>> userDoc = usersCollection.doc(uid);
    DocumentSnapshot<Map<String,dynamic>> documentSnapshot =await userDoc
        .get();
    var json = documentSnapshot.data();
    return UserModel(
        id: json?["id"],
        name: json?["name"],
        email: json?["email"]);
  }




}