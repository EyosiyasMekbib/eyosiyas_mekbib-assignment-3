import 'dart:convert';
import 'package:gulit/model/GroceryItem.dart';
import 'package:http/http.dart' as http;

class ApiServiceProvider {
  Future<List<GroceryItem>> fetchGroceries() async {
    final response = await http.get(
      Uri.parse('https://63ee18fe5e9f1583bdbc1af3.mockapi.io/Grocery'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return GroceryItem.toList(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}
