import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cursos.dart';

class ApiService {
  Future<List<Cursos>> fetchCursos() async {
    final response = await http
        .get(Uri.parse('https://arquivos.ectare.com.br/cursos.json'));

    if (response.statusCode == 200) {
      // Decodificar com UTF-8 antes de converter para JSON
      final decodedResponse = utf8.decode(response.bodyBytes);
      return (json.decode(decodedResponse) as List)
          .map((item) => Cursos.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
