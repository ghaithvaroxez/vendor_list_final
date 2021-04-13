// To parse this JSON data, do
//
//     final searchCompany = searchCompanyFromJson(jsonString);

import 'dart:convert';

SearchCompany searchCompanyFromJson(String str) =>
    SearchCompany.fromJson(json.decode(str));

String searchCompanyToJson(SearchCompany data) => json.encode(data.toJson());

class SearchCompany {
  SearchCompany({
    this.companies,
  });

  List<SearchedCompany> companies;

  factory SearchCompany.fromJson(Map<String, dynamic> json) => SearchCompany(
        companies: List<SearchedCompany>.from(
            json["companies"].map((x) => SearchedCompany.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "companies": List<dynamic>.from(companies.map((x) => x.toJson())),
      };
}

class SearchedCompany {
  SearchedCompany({
    this.id,
    this.name,
    this.logo,
    this.address,
    this.mobile,
    this.phone,
    this.vendorId,
    this.vendor,
  });

  int id;
  String name;
  String logo;
  String address;
  String mobile;
  String phone;
  int vendorId;
  String vendor;

  factory SearchedCompany.fromJson(Map<String, dynamic> json) =>
      SearchedCompany(
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
