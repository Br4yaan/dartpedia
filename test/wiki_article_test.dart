/*
  ==============================================================
  Projeto: dartpedia001
  Arquivo: test/wiki_article_test.dart
  Versão: 0.0.0
  Descritivo do Código:
    - Lição 10: Testes unitários para desserialização JSON da classe WikiArticle usando package:test.
  ==============================================================
*/

import 'package:test/test.dart';
import 'package:dartpedia001/src/wiki_article.dart';

void main() {
  group('WikiArticle - Testes de Desserialização JSON', () {
    test('Deve desserializar corretamente um JSON completo da Wikipédia', () {
      final jsonMock = {
        'title': 'Dart',
        'extract': 'Dart é uma linguagem de programação estruturada.',
        'content_urls': {
          'desktop': {
            'page': 'https://pt.wikipedia.org/wiki/Dart'
          }
        }
      };

      final article = WikiArticle.fromJson(jsonMock);

      expect(article.title, equals('Dart'));
      expect(article.extract, equals('Dart é uma linguagem de programação estruturada.'));
      expect(article.pageUrl, equals('https://pt.wikipedia.org/wiki/Dart'));
    });

    test('Deve fornecer valores padrão quando campos estiverem ausentes no JSON', () {
      final jsonIncompleto = <String, dynamic>{};

      final article = WikiArticle.fromJson(jsonIncompleto);

      expect(article.title, equals('Sem título'));
      expect(article.extract, equals('Nenhum resumo disponível.'));
      expect(article.pageUrl, isNull);
    });
  });
}
