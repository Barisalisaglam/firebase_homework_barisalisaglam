import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:homework_barisalisaglam/model/character.dart';
import 'package:homework_barisalisaglam/view/add_character_page.dart';
import 'package:homework_barisalisaglam/view_model/add_character_page_view_model.dart';
import 'package:provider/provider.dart';

class MainViewModel with ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Character> _characters = [];

  List<Character> get characters => _characters;

  MainViewModel(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getCharacters();
    });

  }

  void _getCharacters() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection("characters").get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> documentsSnapshot
        in snapshot.docs) {
      Character character =
          Character.fromMap(documentsSnapshot.id, documentsSnapshot.data(),
          );
          _characters.add(character);
    }
    notifyListeners();
  }

  void openAddCharacterPage(BuildContext context) {
    MaterialPageRoute pageRoute = MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => AddCharacterViewModel(),
        child: AddCharacterPage(),
      ),
    );
    Navigator.push(context, pageRoute).then((value) {
      _characters.clear();
      _getCharacters();
    });
  }
}
