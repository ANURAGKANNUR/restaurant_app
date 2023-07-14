import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/restaurents_model.dart';

class Resources {
  Future<Restaurants> getAllRestaurants() async {
    final response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/b91498e7-c7fd-48bc-b16a-5cb970a3af8a'));
    final data = jsonDecode(response.body);
    return Restaurants.fromJson(data);
  }
}
