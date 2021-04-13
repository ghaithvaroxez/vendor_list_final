// To parse this JSON data, do
//
//     final homeResponse = homeResponseFromJson(jsonString);

import 'dart:convert';

import 'package:vendor_list/models/vendors_search/vendors_search_response.dart';

HomeResponse homeResponseFromJson(String str) =>
    HomeResponse.fromJson(json.decode(str));

String homeResponseToJson(HomeResponse data) => json.encode(data.toJson());

class HomeResponse {
  HomeResponse({
    this.advert,
    this.vendors,
  });

  List<Advert> advert;
  List<Vendor> vendors;

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
        advert:
            List<Advert>.from(json["advert"].map((x) => Advert.fromJson(x))),
        vendors:
            List<Vendor>.from(json["vendors"].map((x) => Vendor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "advert": List<dynamic>.from(advert.map((x) => x.toJson())),
        "vendors": List<dynamic>.from(vendors.map((x) => x.toJson())),
      };
}

class Advert {
  Advert({
    this.id,
    this.titleAr,
    this.titleEn,
    this.bodyAr,
    this.bodyEn,
    this.image,
    this.order,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String titleAr;
  String titleEn;
  dynamic bodyAr;
  dynamic bodyEn;
  String image;
  int order;
  DateTime createdAt;
  DateTime updatedAt;

  factory Advert.fromJson(Map<String, dynamic> json) => Advert(
        id: json["id"],
        titleAr: json["title_ar"],
        titleEn: json["title_en"],
        bodyAr: json["body_ar"],
        bodyEn: json["body_en"],
        image: json["image"],
        order: json["order"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title_ar": titleAr,
        "title_en": titleEn,
        "body_ar": bodyAr,
        "body_en": bodyEn,
        "image": image,
        "order": order,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
