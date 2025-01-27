abstract class DatabaseService {
  Future<void> addData(
      {required String path, required Map<String, dynamic> data, String? docID});
    //this method is used to fetch data from the database
  Future<Map<String, dynamic>> fetchData(
      {required String path, required String docID});

      Future<bool>checkIfDataExists({required String path, required String docID});

    
}
