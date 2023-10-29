import 'package:queer_world/repository/database_object.dart';

abstract class CudRepository {
  Future<void> replace(String path, Map<String, dynamic> object);

  Future<void> save(String path, DatabaseObject object, {bool merge = true});

  Future<void> update(String path, Map<String, Object> object);

  Future<void> delete(String path);

  Future<List<void>> deleteAll(String collectionPath);
}
