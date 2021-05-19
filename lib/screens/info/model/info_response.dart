// To parse this JSON data, do
//
//     final infoResponse = infoResponseFromJson(jsonString);

import 'dart:convert';

import 'package:vendor_list/screens/company_list/model/company_list_response.dart';



InfoResponse infoResponseFromJson(String str) =>
    InfoResponse.fromJson(json.decode(str));

String infoResponseToJson(InfoResponse data) => json.encode(data.toJson());

class InfoResponse {
  InfoResponse({
    this.company,
  });

  InfoCompany company;

  factory InfoResponse.fromJson(Map<String, dynamic> json) => InfoResponse(
        company: InfoCompany.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "company": company.toJson(),
      };
}

class InfoCompany {
  InfoCompany({
    this.id,
    this.name,
    // this.logo,
    this.responser,
    this.address,
    this.mobile,
    this.phone,
    this.website,
    this.email,
    this.profile,
    this.vendorId,
    this.vendor,
  });

  int id;
  String name;
  String logo="";
  String responser;
  String address;
  String mobile;
  String phone;
  String website;
  String email;
  String profile;
  int vendorId;
  String vendor;

  Company toCompany() {
    return new Company(
      id: id,
      name: name,
      logo: logo,
      address: address,
      mobile: mobile,
      phone: phone,
      vendorId: vendorId,
      vendor: vendor,
    );
  }

  factory InfoCompany.fromJson(Map<String, dynamic> json) => InfoCompany(
        id: json["id"]??0,
        name: json["name"]??"",
        // logo: json["logo"],
        responser: json["responser"]??"",
        address: json["address"]??"",
        mobile: json["mobile"]??"",
        phone: json["phone"]??"",
        website: json["website"]??"",
        email: json["email"]??"",
        profile: json["profile"]??"",
        vendorId: json["vendor_id"]??0,
        vendor: json["vendor"]??"",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "logo": logo,
        "responser": responser,
        "address": address,
        "mobile": mobile,
        "phone": phone,
        "website": website,
        "email": email,
        "profile": profile,
        "vendor_id": vendorId,
        "vendor": vendor,
      };
}
