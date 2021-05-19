import 'package:vendor_list/service/http_service.dart';

import '../model/about_response.dart';

class AboutRepository
{
  static Future<List<Post>> getAbout()async
  {
    try {
      final response = await HttpService.getRequest("about");

      print("repo:" + response.body);
      if (response.statusCode == 200) {
        final result = aboutResponseFromJson(response.body).posts;
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