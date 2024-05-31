import 'dart:developer';

import 'package:http/http.dart' as https;
import 'package:http/http.dart';

class ProfileRepo {
  static String apiUrl = 'https://dummyapi.online/api/social-profiles/';

  static Future<Response> getProfileData({required int userId}) async {
    try {
      var response = await https.get(
        Uri.parse("$apiUrl$userId"),
      );
      return https.Response(response.body, response.statusCode);
    } catch (e) {
      log('Exception occurs');
      return https.Response('$e', 400);
    }
  }
}
