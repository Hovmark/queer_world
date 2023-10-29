import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:queer_world/models/enum/business_type.dart';

class Business {
  final BusinessType type;
  final String name;
  final String description;
  final List<String> tags;
  final String? location;
  final String? website;
  final Timestamp? requestedAt;
  final Timestamp? approvedAt;

  Business(
      {required this.type,
      required this.name,
      required this.description,
      required this.tags,
      this.location,
      this.website,
      this.requestedAt,
      this.approvedAt});

  String get locationOrUndefined => location ?? "Undefined";
  String get websiteOrUndefined => website ?? "Undefined";
}

final businessList = [nenvi, marleah];

final todaysSelection = nenvi;

final myLiked = [nenvi];

final nenvi = Business(
    type: BusinessType.business,
    name: "Nenvi Studio",
    description: "Design and App development",
    tags: ["design", "app", "development"],
    location: "Gbg");

final marleah = Business(
    type: BusinessType.business,
    name: "Marleah",
    description: "Photographer",
    tags: ["Photo"],
    location: "Cph");
