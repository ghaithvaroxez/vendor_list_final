
import 'package:vendor_list/service/http_service.dart';

import '../model/company_list_response.dart';

class CompanyListRepository {
  static Future<List<Company>> getCompanies(int id) async {
    try {
      final response = await HttpService.getRequest("vendor_companies/$id");

      print("repo:" + response.body);
      if (response.statusCode == 200) {
        final result = companyListResponseFromJson(response.body).companies;
        print(result);
        return result;
      } else {
        return [];
      }
    } catch (e) {
      print("errrrrrrrrrrrror");
      throw e;
    }
  }
}
