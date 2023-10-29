import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queer_world/models/enum/business_type.dart';
import 'package:queer_world/repository/database_object.dart';
import 'package:queer_world/repository/firestore/firestore_converter.dart';

class BusinessEntity extends FirestoreConverter implements DatabaseObject {
  static const String kCollectionName = 'businesses';
  static const String fieldBusinessId = 'businessId';
  static const String fieldBusinessType = 'businessType';
  static const String fieldBusiness = 'business';
  static const String fieldDescription = 'description';
  static const String fieldWebsite = 'website';
  static const String fieldInstagram = 'instagram';
  static const String fieldTikTok = 'tiktok';
  static const String fieldFacebook = 'facebook';
  static const String fieldTags = 'tags';
  static const String fieldLocation = 'location';
  static const String fieldRequestedAt = 'requestedAt';

  final String businessId;
  final BusinessType businessType;
  final String business;
  final String description;
  final String website;
  final String instagram;
  final String tiktok;
  final String facebook;
  final List<String> tags;
  // final String location;
  final Timestamp requestedAt;

  BusinessEntity(
      {required this.businessType,
      required this.business,
      required this.description,
      required this.website,
      required this.instagram,
      required this.tiktok,
      required this.facebook,
      required this.tags,
      // required this.location,
      required this.requestedAt})
      : businessId = DatabaseObject.generateUUID;

  @override
  String get collectionName => kCollectionName;

  @override
  String get collectionPath => BusinessEntity.kCollectionName;

  @override
  String get documentId => businessId;

  String get path => '$collectionName/$documentId';

  @override
  Map<String, Object?> toJson() {
    return {
      fieldBusinessId: businessId,
      fieldBusinessType: businessType.toString(),
      fieldBusiness: business,
      fieldDescription: description,
      fieldWebsite: website,
      fieldInstagram: instagram,
      fieldTikTok: tiktok,
      fieldFacebook: facebook,
      fieldTags: tags,
      // fieldLocation: location,
      fieldRequestedAt: requestedAt,
    };
  }

  factory BusinessEntity.fromJson(Map<String, Object?> json) {
    return BusinessEntity(
      // businessId: json[fieldBusinessId] as String,
      businessType: json[fieldBusinessType] != null
          ? BusinessType.fromJson(json)
          : BusinessType.other,
      business: json[fieldBusiness] as String,
      description: json[fieldDescription] as String,
      website: json[fieldWebsite] as String,
      instagram: json[fieldInstagram] as String,
      tiktok: json[fieldTikTok] as String,
      facebook: json[fieldFacebook] as String,
      tags: json[fieldTags] as List<String>,
      // location: json[fieldLocation] as String,
      requestedAt: json[fieldRequestedAt] as Timestamp,
    );
  }
}
