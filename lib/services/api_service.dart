import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class ApiService {
  static const String baseUrl = 'https://thronesapi.com/api/v2';

  Future<List<Character>> getCharacters() async {
    final response = await http.get(Uri.parse('$baseUrl/characters'));
    
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('Error al cargar personajes');
    }
  }

  Future<Character> getCharacter(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/characters/$id'));
    
    if (response.statusCode == 200) {
      return Character.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error al cargar el personaje');
    }
  }
}