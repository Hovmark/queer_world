import 'package:queer_world/models/entity/business_entity.dart';

abstract class FirestoreConverter {
  FirestoreConverter();

  factory FirestoreConverter.fromJson(
      String collectionName, Map<String, Object?> json) {
    switch (collectionName) {
      case BusinessEntity.kCollectionName:
        {
          return BusinessEntity.fromJson(json);
        }
      default:
        {
          throw Exception(
            "Couldn't find class to convert to $collectionName! Have you added the class to Firestore Converter?",
          );
        }
    }
  }
}
