import 'package:http/http.dart' as http;
import 'package:vendor_list/widgets/widgets.dart';

class HttpService {
  static String baseUrl = "http://vindorlist.sourcecode-ai.com/api/";

  static Future<http.Response> getRequest(endPoint) async {
    http.Response response;
    final url = Uri.parse('$baseUrl$endPoint');
    // final url =Uri.parse("http://vindorlist.sourcecode-ai.com/api/getSearchCompanies?name=ar");
    try {
      response = await http.get(url);
      print(response.statusCode);
      print(endPoint);
    } catch (e) {
      print("Error in Http");
      throw e;
    }
    return response;
  }

  static Future<http.Response> postRequest(endPoint) async {
    http.Response response;
    final url = Uri.parse('$baseUrl$endPoint');
    // final url =Uri.parse("http://vindorlist.sourcecode-ai.com/api/getSearchCompanies?name=ar");
    try {
      response = await http.post(url);
      print(response.statusCode);
      print(endPoint);
    } catch (e) {
      print("Error in Http");
      throw e;
    }
    return response;
  }
}
