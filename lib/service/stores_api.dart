import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stores/model/store.dart';

class StoresApi {
  Future<List<Store>> fetchStores() async {
    final response = await http
        .get(Uri.parse('https://stud.hosted.hr.nl/1007501/data.json'));
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body)['results'];
      return json.map((data) => Store.fromJson(data)).toList();
    } else {
      throw Exception("Couldn't load in stores.");
    }
  }
}
