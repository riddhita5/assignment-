import 'package:cloud_firestore/cloud_firestore.dart';

class ViewCounter {
  static Future<void> incrementView(String movieId) async {
    try {
      await FirebaseFirestore.instance
          .collection('Movies')
          .doc(movieId)
          .update({
        'views': FieldValue.increment(1),
      });
    } catch (e) {
      print('Error incrementing views: $e');
    }
  }
}
