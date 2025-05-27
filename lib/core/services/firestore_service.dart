import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? docID}) async {
    if (docID != null) {
      firestore.collection(path).doc(docID).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

//fetch user data
  @override
  Future<dynamic> fetchData(
      {required String path,
      String? docID,
      Map<String, dynamic>? query}) async {
    if (docID != null) {
      var data = await firestore.collection(path).doc(docID).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderByField, descending: descending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  //check if data exists
  @override
  Future<bool> checkIfDataExists(
      {required String path, required String docID}) async {
    var data = await firestore.collection(path).doc(docID).get();
    return data.exists;
  }
 // ✅ Toggle Favorite (add/remove)
  Future<void> toggleFavorite({
    required String userId,
    required String productId,
  }) async {
    final userRef = firestore.collection('users').doc(userId);
    final snapshot = await userRef.get();

    List<String> favorites = [];
    if (snapshot.exists && snapshot.data()?['favorites'] != null) {
      favorites = List<String>.from(snapshot.data()!['favorites']);
    }

    if (favorites.contains(productId)) {
      favorites.remove(productId);
    } else {
      favorites.add(productId);
    }

    await userRef.set({'favorites': favorites}, SetOptions(merge: true));
  }

  // ✅ Get User's Favorite List
  Future<List<String>> getFavorites(String userId) async {
    final userRef = firestore.collection('users').doc(userId);
    final snapshot = await userRef.get();

    if (snapshot.exists && snapshot.data()?['favorites'] != null) {
      return List<String>.from(snapshot.data()!['favorites']);
    } else {
      return [];
    }
  }
  
}
