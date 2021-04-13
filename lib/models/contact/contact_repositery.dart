import 'package:vendor_list/service/http_service.dart';

import 'contact_response.dart';

class ContactRepositery {
  static Future<List<Contact>> getContacts() async {
    try {
      final response = await HttpService.getRequest("contact");
      print(response.statusCode);

      if (response.statusCode == 200) {
        final result = contactResponseFromJson(response.body).contacts;
        print(result);
        return result;
      } else
        return [];
    } catch (e) {
      throw e;
    }
  }

  static Future<List<Social>> getSocial() async {
    try {
      final response = await HttpService.getRequest("contact");
      if (response.statusCode == 200) {
        final result = contactResponseFromJson(response.body).socials;
        return result;
      } else {
        return [];
      }
    } catch (e) {
      throw e;
    }
  }
}
