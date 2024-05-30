import 'package:http/http.dart' as http;
import 'dart:convert';

class Apiwordresponse{

  static const String _baseUrl = 'https://api.datamuse.com/words';

  Future<List<dynamic>?> fetchDefinitions(String word) async {
    final response = await http.get(Uri.parse('https://api.datamuse.com/words?sp=$word&md=d'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Failed to load definitions: ${response.statusCode}');
      return null;
    }
  }

  Future<List<dynamic>?> fetchSynonyms(String word) async {
    final response = await http.get(Uri.parse('$_baseUrl?rel_syn=$word'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Failed to load synonyms: ${response.statusCode}');
      return null;
    }
  }

  Future<List<dynamic>?> fetchAntonyms(String word) async {
    final response = await http.get(Uri.parse('$_baseUrl?rel_ant=$word'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Failed to load antonyms: ${response.statusCode}');
      return null;
    }
  }

  Future<List<dynamic>?> fetchRelatedWords(String word) async {
    final response = await http.get(Uri.parse('$_baseUrl?ml=$word'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Failed to load related words: ${response.statusCode}');
      return null;
    }
  }
}