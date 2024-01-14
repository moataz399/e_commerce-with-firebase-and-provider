import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class FireStoreServices {
  //private constructor
  FireStoreServices._();

  final _fireStore = FirebaseFirestore.instance;

  static final instance = FireStoreServices._();


  // set = add or update
  Future<void> setData(
      {required String path, required Map<String, dynamic> data}) async {
    final reference = _fireStore.doc(path);

    debugPrint("Request data : $data");
    await reference.set(data);
  }

  Future<void> deleteData({required String path}) async {
    final reference = _fireStore.doc(path);

    debugPrint("Deleted Path : $path");
    await reference.delete();
  }

  Stream<T> documentsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
  }) {
    final reference = _fireStore.doc(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }

  Stream<List<T>> collectionStream<T>(
      {required String path,
      required T Function(Map<String, dynamic>? data, String documentId)
          builder,
      Query Function(Query query)? queryBuilder,

      //lhs left hand side , rhs right handSide
      int Function(T lhs, T rhs)? sort}) {
    Query query = _fireStore.collection(path);

    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) =>
              builder(snapshot.data() as Map<String, dynamic>, snapshot.id))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }
}
