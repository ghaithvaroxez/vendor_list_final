
import 'package:vendor_list/service/http_service.dart';

class TokenRepository {
  static sendToken(String query) async {
    try {
      final response =
      await HttpService.postRequest("notify/$query");
print("after sending token :"+response.body);
      // if (response.statusCode == 200) {
      //   final result = searchVendorsFromJson(response.body).vendors;
      //   print(result);
      //   return result;
      // }
      // else {
      //   return [];
      // }
    } catch (e) {
      throw e;
    }
  }
}
