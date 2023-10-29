import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queer_world/repository/cud_repository.dart';
import 'package:queer_world/repository/database_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:async/async.dart';

class CudRepositoryFirestore implements CudRepository {
  const CudRepositoryFirestore();

  FirebaseFirestore get instance => FirebaseFirestore.instance;

  @override
  Future<void> replace(String path, Map<String, dynamic> object) {
    return instance.doc(path).set(object, SetOptions(merge: true));
  }

  @override
  Future<void> save(String path, DatabaseObject object, {bool merge = true}) {
    return instance
        .doc(path)
        .set(object.toJson(), SetOptions(merge: merge))
        .then((value) => debugPrint(
            "${object.collectionName}/${object.documentId}  Updated"))
        .catchError(
          (error) => debugPrint(
            "Failed to update ${object.collectionName}/${object.documentId}: $error",
          ),
        );
  }

  @override
  Future<void> update(String path, Map<String, Object> object) {
    return instance.doc(path).update(object).catchError(
          (error) => debugPrint(
            "Failed to update $object at: $path: $error",
          ),
        );
  }

  @override
  Future<void> delete(String path) {
    return instance.doc(path).delete();
  }

  @override
  Future<List<void>> deleteAll(String collectionPath) async {
    final snapshot = await instance.collection(collectionPath).get();
    final FutureGroup futureGroup = FutureGroup<void>();
    for (final doc in snapshot.docs) {
      futureGroup.add(doc.reference.delete());
    }
    futureGroup.close();
    return futureGroup.future;
  }
}
