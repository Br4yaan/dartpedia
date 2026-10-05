/*
  ==============================================================
  Projeto: dartpedia001
  Arquivo: lib/src/wiki_article.dart
  Versão: 0.0.0
  Descritivo do Código:
    - Lição 10: Modelo de dados WikiArticle com fábrica de desserialização JSON (fromJson).
  ==============================================================
*/

class WikiArticle {
  final String title;
  final String extract;
  final String? pageUrl;

  WikiArticle({
    required this.title,
    required this.extract,
    this.pageUrl,
  });

  /// Construtor de fábrica para desserialização de Map/JSON
  factory WikiArticle.fromJson(Map<String, dynamic> json) {
    return WikiArticle(
      title: json['title'] as String? ?? 'Sem título',
      extract: json['extract'] as String? ?? 'Nenhum resumo disponível.',
      pageUrl: json['content_urls']?['desktop']?['page'] as String?,
    );
  }
}
