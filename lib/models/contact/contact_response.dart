// To parse this JSON data, do
//
//     final contactResponse = contactResponseFromJson(jsonString);

import 'dart:convert';

ContactResponse contactResponseFromJson(String str) =>
    ContactResponse.fromJson(json.decode(str));

String contactResponseToJson(ContactResponse data) =>
    json.encode(data.toJson());

class ContactResponse {
  ContactResponse({
    this.socials,
    this.contacts,
  });

  List<Social> socials;
  List<Contact> contacts;

  factory ContactResponse.fromJson(Map<String, dynamic> json) =>
      ContactResponse(
        socials:
            List<Social>.from(json["socials"].map((x) => Social.fromJson(x))),
        contacts: List<Contact>.from(
            json["contacts"].map((x) => Contact.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "socials": List<dynamic>.from(socials.map((x) => x.toJson())),
        "contacts": List<dynamic>.from(contacts.map((x) => x.toJson())),
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
        id: json["id"],
        type: json["type"],
        value: json["value"],
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
        id: json["id"],
        type: json["type"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "link": link,
      };
}
