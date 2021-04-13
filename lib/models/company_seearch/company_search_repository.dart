import 'package:vendor_list/models/company_list/company_list_response.dart';
import 'package:vendor_list/models/company_seearch/company_search_response.dart';
import 'package:vendor_list/models/info/info_response.dart';
import 'package:vendor_list/models/vendors_search/vendors_search_response.dart';
import 'package:vendor_list/service/http_service.dart';

class CompanySearchRepository {
  static Future<List<Company>> getSearchedCompany(String query) async {
    try {
      // final response = await HttpService.getRequest("vendor_companies/30");
      final response =
          await HttpService.postRequest("getSearchCompanies?name=$query");
      // final response = await HttpService.postRequest("getSearchCompanies?name=a");
      http: //vindorlist.sourcecode-ai.com/api/getSearchCompanies?name=ar
      if (response.statusCode == 200) {
        print(response.statusCode);
        final result = companyListResponseFromJson(response.body).companies;
        // print(result);
        print("companies search result =" + result.toString());
        return result;
      }
      else return [];
    } catch (e) {
      throw e;
    }
  }
}
