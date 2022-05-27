import 'package:app_motus/data/entities/word.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WordFirestore {
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static WordFirestore? _instance;

  WordFirestore._();

  static late final CollectionReference<Word> _wordRef;

  static WordFirestore? getInstance() {
    if(_instance == null) {
      _firestore.collection('words2').withConverter<Word>(
          fromFirestore: (snapshot, _) => Word.fromJson(snapshot.data()!),
          toFirestore: (word, _) => word.toJson()
      );
      _instance = WordFirestore._();
    }
    return _instance!;
  }

  Future<QuerySnapshot<Word>> getAll() async {
    return _wordRef.get();
  }

  Future<void> insertWord(Word word) async {
    await _wordRef.add(word);
  }

  Future<void> insertWordWithId(Word word, String id) async {
    return _wordRef.doc(id).set(word);
  }

  Future<QuerySnapshot<Word>> searchWord(String text) async {
    return _wordRef.where('text', isEqualTo: text).get();
  }

  Future<void> updateWord(Word word, String id) async {
    return _wordRef.doc(id).update(word.toJson());
  }

  Future<void> deleteWord(String id) async {
    return _wordRef.doc(id).delete();
  }
}