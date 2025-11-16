import 'package:flutter/material.dart';

class Category {
  int id;
  String nameEn;
  String nameAr; 
  String imagePath; 
  IconData iconData; 

  Category({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.imagePath,
    required this.iconData, 
  });

  static List<Category> categories = [
    Category(
      id: 1,
      nameEn: "Sport",
      nameAr: "رياضة",
      imagePath: "assets/images/sport.png",
      iconData: Icons.sports_soccer_outlined,
    ),
    Category(
      id: 2,
      nameEn: "Birthday",
      nameAr: "عيد ميلاد",
      imagePath: "assets/images/birthday.png",
      iconData: Icons.cake_outlined,
    ),
    Category(
      id: 3,
      nameEn: "Meeting",
      nameAr: "اجتماع",
      imagePath: "assets/images/meeting.png",
      iconData: Icons.meeting_room_outlined,
    ),
    Category(
      id: 4,
      nameEn: "Gaming",
      nameAr: "ألعاب",
      imagePath: "assets/images/gaming.png",
      iconData: Icons.gamepad_outlined,
    ),
    Category(
      id: 5,
      nameEn: "Eating",
      nameAr: "أكل",
      imagePath: "assets/images/eating.png",
      iconData: Icons.fastfood_outlined,
    ),
    Category(
      id: 6,
      nameEn: "Holiday",
      nameAr: "إجازة",
      imagePath: "assets/images/holiday.png",
      iconData: Icons.beach_access_outlined, 
    ),
    Category(
      id: 7,
      nameEn: "Exhibition",
      nameAr: "معرض",
      imagePath: "assets/images/exhibition.png",
      iconData: Icons.art_track_outlined, 
    ),
    Category(
      id: 8,
      nameEn: "Workshop",
      nameAr: "ورشة عمل",
      imagePath: "assets/images/workshop.png",
      iconData: Icons.design_services_outlined,
    ),
    Category(
      id: 9,
      nameEn: "Book Club",
      nameAr: "نادي كتاب",
      imagePath: "assets/images/book_club.png",
      iconData: Icons.menu_book_outlined,
    ),
  ];
}