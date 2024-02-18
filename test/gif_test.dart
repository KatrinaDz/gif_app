import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test('Search for GIFs by specific keyword', () async {

    const apiKey = 'M2P23LpYkoLWgOsEHF7ponZ1ZsjH97Tj';
    const searchword = 'sun'; 
    final response = await http.get(Uri.parse('https://api.giphy.com/v1/gifs/search?api_key=$apiKey&q=$searchword'));
    
    expect(response.statusCode, 200);

    final Map<String, dynamic> responseData = json.decode(response.body);

    expect(responseData.containsKey('data'), true);

    final gifList = responseData['data'] as List;
    expect(gifList.isNotEmpty, true);
  });
}
