import 'package:cloud_firestore/cloud_firestore.dart';

class MovieService {
  static final CollectionReference _moviesCollection =
      FirebaseFirestore.instance.collection('Movies');

  static Future<void> incrementViewCount(String movieId) async {
    await _moviesCollection.doc(movieId).update({
      'views': FieldValue.increment(1),
    });
  }
}
