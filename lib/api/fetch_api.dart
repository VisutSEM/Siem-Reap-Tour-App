import 'dart:convert';
import 'package:siem_reap_tour/models/image_model.dart';
import 'package:http/http.dart' as http;

class FetchApi {
  static Future<List<ImageModel>> fetchApi() async {
    final url = Uri.parse("https://fakestoreapi.com/products");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => ImageModel.fromJson(e)).toList();
    } else {
      throw Exception("No data");
    }
  }
}
