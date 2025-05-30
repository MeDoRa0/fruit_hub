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
    await  firestore.collection(path).doc(docID).set(data);
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
  
  @override
  Future<void> deleteData({required String path, required String docID})async {
    await firestore.collection(path).doc(docID).delete();
   
  }
  
 @override
Future<List<Map<String, dynamic>>> fetchWhereIn({
  required String path,
  required String field,
  required List<String> values,
}) async {
  try {
    final snapshot = await FirebaseFirestore.instance
        .collection(path)
        .where(field, whereIn: values)
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  } catch (e) {
    throw Exception('fetchWhereIn failed: $e');
  }
}


  
}
