abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docID,
  });
  //this method is used to fetch data from the database
  Future<dynamic> fetchData({
    required String path,
    String? docID,
    Map<String, dynamic>? query,
  });

  Future<bool> checkIfDataExists({
    required String path,
    required String docID,
  });

    Future<void> deleteData({
    required String path,
    required String docID,
  });

  Future<List<Map<String, dynamic>>> fetchWhereIn({
  required String path,
  required String field,
  required List<String> values,
});


}
