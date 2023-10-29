import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:uuid/uuid.dart';

abstract class DatabaseObject<T> {
  DatabaseObject();

  factory DatabaseObject.fromJson(Map<String, Object?> json) {
    throw UnimplementedError(
        "Abstract class, be sure to implement constructor");
  }

  String get documentId;

  String get collectionName;

  Map<String, Object?> toJson();

  static String get generateUUID => const Uuid().v4();

  static String generateHashUUID(String text) =>
      sha256.convert(utf8.encode(text)).toString();

  String get collectionPath => collectionName;
}
