import 'package:http/http.dart' as http;
import 'package:vendor_list/widgets/widgets.dart';

class HttpService {
  static String baseUrl = "http://vindorlist.sourcecode-ai.com/api/";

  static Future<http.Response> getRequest(endPoint) async {
    http.Response response;
    final url = Uri.parse('$baseUrl$endPoint');

    // final url =Uri.parse("http://vindorlist.sourcecode-ai.com/api/getSearchCompanies?name=ar");
    try {
      Map<String ,String> headers;
     //  endPoint=="screens.contact" ?
     //  headers={"lang":"en"}
     // :
      headers={"lang":english?"en":"ar"};
      print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"+url.toString()+headers.toString()+"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
      response = await http.get(url,headers: headers);
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
      Map<String ,String> headers={"lang":english?"en":"ar"};
      print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"+url.toString()+headers.toString()+"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
      response = await http.post(url,headers: headers);
      print(response.statusCode);
      print(endPoint);
    } catch (e) {
      print("Error in Http");
      throw e;
    }
    return response;
  }
}
