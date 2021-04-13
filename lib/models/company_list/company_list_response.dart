// To parse this JSON data, do
//
//     final companyListResponse = companyListResponseFromJson(jsonString);

import 'dart:convert';

import 'package:vendor_list/helper/sharedpref_helper.dart';

CompanyListResponse companyListResponseFromJson(String str) =>
    CompanyListResponse.fromJson(json.decode(str));

String companyListResponseToJson(CompanyListResponse data) =>
    json.encode(data.toJson());

class CompanyListResponse {
  CompanyListResponse({
    this.companies,
  });

  List<Company> companies;

  factory CompanyListResponse.fromJson(Map<String, dynamic> json) =>
      CompanyListResponse(
        companies: List<Company>.from(
            json["companies"].map((x) => Company.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "companies": List<dynamic>.from(companies.map((x) => x.toJson())),
      };
}

class Company {
  Company({
    this.id,
    this.name,
    this.logo,
    this.address,
    this.mobile,
    this.phone,
    this.vendorId,
    this.vendor,
  }) {
    saved = false;
    checkSaved();
  }

  checkSaved() async {
    saved = await SharedPreferenceHelper.isSaved(id.toString());
  }

  int id;
  String name;
  String logo;
  String address;
  String mobile;
  String phone;
  int vendorId;
  String vendor;
  bool saved;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        logo: json["logo"],
        address: json["address"],
        mobile: json["mobile"],
        phone: json["phone"],
        vendorId: json["vendor_id"],
        vendor: json["vendor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "address": address,
        "mobile": mobile,
        "phone": phone,
        "vendor_id": vendorId,
        "vendor": vendor,
      };
}
