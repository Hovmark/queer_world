import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queer_world/repository/database_object.dart';
import 'package:queer_world/repository/firestore/firestore_converter.dart';

class UserEntity extends FirestoreConverter implements DatabaseObject {
  static const String kCollectionName = 'users';
  static const String fieldUserId = 'userId';
  static const String fieldUsername = 'username';
  static const String fieldLikes = 'likes';

  final String userId;
  final String username;
  final List<String> likes;
  final Timestamp createdAt;

  UserEntity({required this.username, required this.likes})
      : userId = DatabaseObject.generateUUID,
        createdAt = Timestamp.now();

  @override
  String get collectionName => kCollectionName;

  @override
  String get collectionPath => UserEntity.kCollectionName;

  @override
  String get documentId => userId;

  String get path => '$collectionName/$documentId';

  @override
  Map<String, Object?> toJson() {
    return {
      fieldUserId: userId,
      fieldUsername: username,
      fieldLikes: likes,
    };
  }

  factory UserEntity.fromJson(Map<String, Object?> json) {
    return UserEntity(
      username: json[fieldUsername] as String,
      likes: json[fieldLikes] as List<String>,
    );
  }
}
