/*
  ==============================================================
  Projeto: dartpedia001
  Arquivo: lib/src/wiki_article_model.dart
  Versão: 0.0.0
  Descritivo do Código:
    - Lição 09: Modelo de dados WikiArticleModel com desserialização de dados JSON
      utilizando dart:convert e Pattern Matching (correspondência de padrões).
  ==============================================================
*/

import 'dart:convert';

class WikiArticleModel {
  final String title;
  final String extract;
  final String? pageUrl;
  final String? thumbnailUrl;

  WikiArticleModel({
    required this.title,
    required this.extract,
    this.pageUrl,
    this.thumbnailUrl,
  });

  /// Construtor de fábrica utilizando Pattern Matching para extrair dados JSON
  factory WikiArticleModel.fromJson(Map<String, dynamic> json) {
    // 1. Extração segura de propriedades com Pattern Matching simples
    final title = switch (json['title']) {
      String t => t,
      _ => 'Sem título',
    };

    final extract = switch (json['extract']) {
      String e => e,
      _ => 'Nenhum resumo disponível.',
    };

    // 2. Extração de estruturas aninhadas usando Pattern Matching em Mapas e Objetos
    final pageUrl = switch (json) {
      {
        'content_urls': {
          'desktop': {'page': String url}
        }
      } =>
        url,
      _ => null,
    };

    final thumbnailUrl = switch (json) {
      {'thumbnail': {'source': String url}} => url,
      _ => null,
    };

    return WikiArticleModel(
      title: title,
      extract: extract,
      pageUrl: pageUrl,
      thumbnailUrl: thumbnailUrl,
    );
  }

  /// Método utilitário para converter uma String JSON bruta diretamente no modelo
  static WikiArticleModel parseRawJson(String rawJson) {
    final decoded = jsonDecode(rawJson);
    if (decoded is Map<String, dynamic>) {
      return WikiArticleModel.fromJson(decoded);
    }
    throw const FormatException('O payload fornecido não é um objeto JSON válido.');
  }

  /// Converte o objeto de volta para um Map/JSON
  Map<String, dynamic> toJson() => {
        'title': title,
        'extract': extract,
        if (pageUrl != null) 'pageUrl': pageUrl,
        if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl,
      };
}
