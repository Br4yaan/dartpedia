/*
  ==============================================================
  Projeto: dartpedia001
  Pacote: command_runner
  Arquivo: lib/src/string_color_extension.dart
  Versão: 0.0.0
  Descritivo do Código:
    - Lição 07: Extensão no tipo nativo String para aplicação rápida de cores e estilos ANSI.
  ==============================================================
*/

import 'console_color.dart';

extension StringColorExtension on String {
  /// Retorna a string formatada em vermelho
  String get red => ConsoleColor.red.apply(this);

  /// Retorna a string formatada em verde
  String get green => ConsoleColor.green.apply(this);

  /// Retorna a string formatada em amarelo
  String get yellow => ConsoleColor.yellow.apply(this);

  /// Retorna a string formatada em azul
  String get blue => ConsoleColor.blue.apply(this);

  /// Retorna a string formatada em ciano
  String get cyan => ConsoleColor.cyan.apply(this);

  /// Retorna a string formatada em negrito
  String get bold => ConsoleColor.bold.apply(this);
}
