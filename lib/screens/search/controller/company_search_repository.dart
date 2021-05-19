
import 'package:vendor_list/screens/company_list/model/company_list_response.dart';
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
