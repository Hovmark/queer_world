import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:queer_world/models/business.dart';
import 'package:queer_world/models/entity/business_entity.dart';

class BusinessState extends ChangeNotifier {
  Future<DocumentReference> addBusinessRequest(Business business) {
    return FirebaseFirestore.instance
        .collection(BusinessEntity.kCollectionName)
        .add(<String, dynamic>{
      'name': business.name,
      'requestedAt': Timestamp.now(),
      'description': business.description,
      'location': business.location,
      'website': business.website,
      'tags': business.tags,
    });
  }
}
