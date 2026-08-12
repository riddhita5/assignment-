import 'package:cloud_firestore/cloud_firestore.dart';

class MovieActions {
  static Future<void> incrementViews(String docId) async {
    await FirebaseFirestore.instance
        .collection('Movies')
        .doc(docId)
        .update({'views': FieldValue.increment(1)});
  }
}
