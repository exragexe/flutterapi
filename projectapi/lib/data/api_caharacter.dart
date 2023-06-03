import 'package:projectapi/domain/character.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Character>> fetchAllCharacters({int limit = 10}) async {
  final response = await http.get(Uri.parse('https://thesimpsonsquoteapi.glitch.me/quotes?count=$limit'));
  if (response.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(response.body);
    final List<Character> characters = jsonData.map<Character>((result) {
      return Character(
       quote: result['quote'],
       character: result['character'],
       image: result['image'],
        characterDirection: result['characterDirection'],
  );
}).toList();

    return characters;
  } else {
    throw Exception(response.reasonPhrase);
  }
}

}



