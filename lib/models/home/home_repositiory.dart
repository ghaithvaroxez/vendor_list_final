import 'package:vendor_list/models/vendors_search/vendors_search_response.dart';
import 'package:vendor_list/service/http_service.dart';

import 'home_response.dart';

class HomeRepository {
  static Future<List<Vendor>> getVendors() async {
    try {
      final response = await HttpService.getRequest("home/");
      print(response.statusCode);
      print("home repositry");
      if (response.statusCode == 200) {
        final result = homeResponseFromJson(response.body).vendors;
        print(result);
        return result;
      } else
        return [];
    } catch (e) {
      throw e;
    }
  }

  static Future<List<Advert>> getAds() async {
    try {
      final response = await HttpService.getRequest("home/");
      if (response.statusCode == 200) {
        final result = homeResponseFromJson(response.body).advert;
        return result;
      } else {
        return [];
      }
    } catch (e) {
      throw e;
    }
  }
}
