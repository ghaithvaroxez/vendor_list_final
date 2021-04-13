import 'package:vendor_list/service/http_service.dart';

import 'about_response.dart';

class AboutRepository
{
  static Future<About> getAbout()async
  {
    try {
      final response = await HttpService.getRequest("about");

      print("repo:" + response.body);
      if (response.statusCode == 200) {
        final result = aboutFromJson(response.body);
        print(result);
        return result;
      } else {
        return new About();
      }
    } catch (e) {
      print("errrrrrrrrrrrror");
      throw e;
    }

  }
}