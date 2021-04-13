import 'package:vendor_list/models/info/info_response.dart';
import 'package:vendor_list/service/http_service.dart';

class InfoRepository {
  static Future<InfoCompany> getInfoCompany(String id) async {
    try {
      final response = await HttpService.getRequest("company/$id");

      if (response.statusCode == 200) {
        final result = infoResponseFromJson(response.body).company;
        print(result);
        return result;
      } else {
        return new  InfoCompany(
          id: 0,
          name: "name",
          // logo: "logo",
          responser: "responser",
          address: "address",
          mobile: "mobile",
          phone: "phone",
          website: "website",
          email: "email",
          profile: "profile",
          vendorId: 0,
          vendor:"vendor",
        );
      }
    } catch (e) {
      throw e;
    }
  }
}
