import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> buscarResumoWikipedia(String artigo) async {
  final url = Uri.parse('https://pt.wikipedia.org/api/rest_v1/page/summary/$artigo');

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      print('--- ${data['title']} ---');
      print(data['extract']);
    } else {
      print('Erro ao buscar dados. Status Code: ${response.statusCode}');
    }
  } catch (e) {
    print('Ocorreu um erro na requisição: $e');
  }
}

Future<void> main() async {
  print('Buscando informações da Wikipédia...\n');
  await buscarResumoWikipedia('Dart_(linguagem_de_programação)');
}
