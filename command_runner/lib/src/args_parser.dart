/*
  ==============================================================
  Projeto: dartpedia001
  Pacote: command_runner
  Arquivo: lib/src/args_parser.dart
  Versão: 0.0.0
  ==============================================================
*/

class ArgsParser {
  static String obterTermoBusca(List<String> arguments) {
    if (arguments.isNotEmpty) {
      return arguments.join(' ');
    }
    return 'Dart_(linguagem_de_programação)';
  }
}
