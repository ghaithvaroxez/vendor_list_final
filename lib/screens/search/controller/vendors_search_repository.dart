
import 'package:vendor_list/screens/search/model/vendors_search_response.dart';
import 'package:vendor_list/service/http_service.dart';

class VendorSearchRepository {
  static Future<List<Vendor>> getSearchedVendors(String query) async {
    try {
      final response =
          await HttpService.postRequest("getSearchVendors?name=$query");

      if (response.statusCode == 200) {
        final result = searchVendorsFromJson(response.body).vendors;
        print(result);
        return result;
      } else {
        return [];
      }
    } catch (e) {
      throw e;
    }
  }
}
