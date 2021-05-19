// To parse this JSON data, do
//
//     final contactResponse = contactResponseFromJson(jsonString);

import 'dart:convert';

ContactResponse contactResponseFromJson(String str) => ContactResponse.fromJson(json.decode(str));

String contactResponseToJson(ContactResponse data) => json.encode(data.toJson());

class ContactResponse {
  ContactResponse({
    this.socials,
    this.contacts,
    this.addresses,
  });

  List<Social> socials;
  List<Contact> contacts;
  List<Address> addresses;

  factory ContactResponse.fromJson(Map<String, dynamic> json) => ContactResponse(
    socials: List<Social>.from(json["socials"].map((x) => Social.fromJson(x))),
    contacts: List<Contact>.from(json["contacts"].map((x) => Contact.fromJson(x))),
    addresses: List<Address>.from(json["addresses"].map((x) => Address.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "socials": List<dynamic>.from(socials.map((x) => x.toJson())),
    "contacts": List<dynamic>.from(contacts.map((x) => x.toJson())),
    "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
  };
}

class Address {
  Address({
    this.id,
    this.value,
    this.latitude,
    this.longitude,
  });

  int id;
  String value;
  String latitude;
  String longitude;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"]==null?0:json["id"],
    value: json["value"]==null?"":json["value"],
    latitude: json["latitude"]==null?"":json["latitude"],
    longitude: json["longitude"]==null?"":json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "value": value,
    "latitude": latitude,
    "longitude": longitude,
  };
}

class Contact {
  Contact({
    this.id,
    this.type,
    this.value,
  });

  int id;
  String type;
  String value;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    id: json["id"]==null?0:json["id"],
    type: json["type"]==null?"":json["type"],
    value: json["value"]==null?"":json["value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "value": value,
  };
}

class Social {
  Social({
    this.id,
    this.type,
    this.link,
  });

  int id;
  String type;
  String link;

  factory Social.fromJson(Map<String, dynamic> json) => Social(
    id: json["id"]==null?0:json["id"],
    type: json["type"]==null?"": json["type"],
    link: json["link"]==null?"":json["link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "link": link,
  };
}
