import 'package:cloud_firestore/cloud_firestore.dart';

import 'database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId == null) {
      await firestore.collection(path).add(data);
    } else {
      var collection = firestore.collection(path).doc(documentId);
      await collection.set(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      DocumentSnapshot snapshot = await firestore
          .collection(path)
          .doc(documentId)
          .get();
      return snapshot.data() as Map<String, dynamic>;
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query.containsKey('orderBy')) {
          var orderBy = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderBy , descending: descending);
        }
        if (query.containsKey('limit')) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

    @override
  Stream streamData({
    required String path,
    Map<String, dynamic>? query,
  }) async* {
    Query<Map<String, dynamic>> data = firestore.collection(path);
    if (query != null) {
      if (query.containsKey('orderBy')) {
        var orderBy = query['orderBy'];
        var descending = query['descending'];
        data = data.orderBy(orderBy, descending: descending);
      }
      if (query.containsKey('limit')) {
        var limit = query['limit'];
        data = data.limit(limit);
      }
    }
    await for (var result in data.snapshots()) {
      yield result.docs.map((e) => e.data()).toList();
    }
  }

@override
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    var collection = firestore.collection(path).doc(documentId);
    await collection.update(data);
  }
  
  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  }) async {
    DocumentSnapshot snapshot = await firestore
        .collection(path)
        .doc(documentId)
        .get();
    return snapshot.exists;
  }
}
