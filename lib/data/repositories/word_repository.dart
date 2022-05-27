import 'package:cloud_firestore/cloud_firestore.dart';

import '../datasource/firebase/word_firestore.dart';
import '../datasource/local/word_hive.dart';
import '../entities/word.dart';

class WordRepository {
  static WordRepository? _instance;
  static WordHive? _wordHive;
  static WordFirestore? _wordFireStore;

  static Future<WordRepository> getInstance() async {
    if (_instance == null) {
      _wordFireStore = WordFirestore.getInstance();
      _wordHive = await WordHive.getInstance();
      _instance = WordRepository._();
    }
    return _instance!;
  }

  WordRepository._();

  Future<Word> insertWordFromId(Word word, String id) async {
    await _wordFireStore?.insertWordWithId(word, id);
    return word;
  }

  Future<List<Word Function()>> getAllWordsFromFirestore() async {
    QuerySnapshot<Word> words = await _wordFireStore!.getAll();
    return words.docs.map((doc) => doc.data).toList();
  }
}
