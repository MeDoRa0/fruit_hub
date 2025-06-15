import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub/core/services/database_service.dart';


class FireStoreService implements DatabaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docID,
  }) async {
    print("🔥 [FireStore] Add Data to $path/${docID ?? '(auto)'}: $data");
    if (docID != null) {
      await firestore.collection(path).doc(docID).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> fetchData({
    required String path,
    String? docID,
    Map<String, dynamic>? query,
  }) async {
    if (docID != null) {
      final docSnapshot = await firestore.collection(path).doc(docID).get();
      return docSnapshot.data();
    } else {
      Query<Map<String, dynamic>> queryRef = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          final orderByField = query['orderBy'] as String;
          final descending = query['descending'] as bool? ?? false;
          queryRef = queryRef.orderBy(orderByField, descending: descending);
        }
        if (query['limit'] != null) {
          final limit = query['limit'] as int;
          queryRef = queryRef.limit(limit);
        }
      }
      final querySnapshot = await queryRef.get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    }
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String docID,
  }) async {
    final docSnapshot = await firestore.collection(path).doc(docID).get();
    return docSnapshot.exists;
  }

  @override
  Future<void> deleteData({
    required String path,
    required String docID,
  }) async {
    await firestore.collection(path).doc(docID).delete();
  }
  
 @override
Future<void> updateData({
  required String path,
  required Map<String, dynamic> data,
  required String docID,
}) async {
  print("🔥 [FireStore] Update Data at $path/$docID: $data");
  await firestore.collection(path).doc(docID).update(data);
}

}
