import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:siem_reap_tour/models/user_model.dart';

class UserApi {
  static Future<List<UserModel>> getUser() async {
    final url = Uri.parse("https://api.escuelajs.co/api/v1/users");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List dataResponse = jsonDecode(response.body);
      return dataResponse.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception("e");
    }
  }
}
