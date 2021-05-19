// To parse this JSON data, do
//
//     final searchVendors = searchVendorsFromJson(jsonString);

import 'dart:convert';

SearchVendors searchVendorsFromJson(String str) =>
    SearchVendors.fromJson(json.decode(str));

String searchVendorsToJson(SearchVendors data) => json.encode(data.toJson());

class SearchVendors {
  SearchVendors({
    this.vendors,
  });

  List<Vendor> vendors;

  factory SearchVendors.fromJson(Map<String, dynamic> json) => SearchVendors(
        vendors:
            List<Vendor>.from(json["vendors"].map((x) => Vendor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "vendors": List<dynamic>.from(vendors.map((x) => x.toJson())),
      };
}

class Vendor {
  Vendor(
      {this.id,
      this.name,
      // this.image_enum,
      this.companies,
      this.image});

  int id;
  String name;

  // Imagee image_enum;
  String image;
  int companies;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["id"],
        name: json["name"],
        // image_enum: imageValues.map[json["image"]],
        image: json["image"],
        companies: json["companies"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        // "image": imageValues.reverse[image],
        "image": image,
        "companies": companies,
      };
}
