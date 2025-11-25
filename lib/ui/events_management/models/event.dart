import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String? id;
  String? title;
  String? description;
  DateTime? eventDateTime;
  int? categoryId;
  String? categorynameEn;
  String? categorynameAr;
  String? categoryImagePath;
  String? area;
  String? city;
  String? country;

  Event({
    this.id,
    this.title,
    this.description,
    this.eventDateTime,
    this.categoryId,
    this.categorynameEn,
    this.categorynameAr,
    this.categoryImagePath,
    this.area,
    this.city,
    this.country,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'eventDateTime': eventDateTime,
      'categoryId': categoryId,
      'categorynameEn': categorynameEn,
      'categorynameAr': categorynameAr,
      'categoryImagePath': categoryImagePath,
      'area': area,
      'city': city,
      'country': country,
    };
  }

  factory Event.fromFirestore(Map<String, dynamic> json) {
    Timestamp? timestamp = json['eventDateTime'] as Timestamp?;

    return Event(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      eventDateTime: timestamp?.toDate(),
      categoryId: json['categoryId'] as int?,
      categorynameEn: json['categorynameEn'] as String?,
      categorynameAr: json['categorynameAr'] as String?,
      categoryImagePath: json['categoryImagePath'] as String?,
      area: json['area'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
    );
  }
}
