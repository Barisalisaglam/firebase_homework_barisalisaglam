import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homework_barisalisaglam/model/character.dart';

class AddCharacterViewModel with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;


  void addCharacter( BuildContext context, String name, String gender) async{
    Character character = Character(name ,gender);
  
    await _firestore.collection("characters").doc().set(character.toMap());
    Navigator.pop(context);

  }
  
}