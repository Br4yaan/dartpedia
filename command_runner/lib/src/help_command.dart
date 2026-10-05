/*
  ==============================================================
  Projeto: dartpedia001
  Pacote: command_runner
  Arquivo: lib/src/help_command.dart
  Versão: 0.0.0
  Descritivo do Código:
    - Lição 08: Comando HelpCommand usando StringBuffer para construir strings de ajuda de forma iterativa.
  ==============================================================
*/

import 'base_command.dart';

class HelpCommand extends BaseCommand {
  final List<BaseCommand> commands;

  HelpCommand(this.commands, {super.format, super.onOutput});

  @override
  String get name => 'help';

  @override
  String get description => 'Exibe informações detalhadas sobre a utilização e comandos disponíveis.';

  @override
  Future<void> execute(List<String> args) async {
    final buffer = StringBuffer();
    
    buffer.writeln('==============================================');
    buffer.writeln('            AJUDA DA CLI DARTPEDIA            ');
    buffer.writeln('==============================================');
    buffer.writeln('Uso: dart run bin/dartpedia001.dart [opções] <termo>\n');
    buffer.writeln('Comandos disponíveis:');

    for (final cmd in commands) {
      buffer.writeln('  * ${cmd.name.padRight(10)} - ${cmd.description}');
    }

    buffer.writeln('  * ${name.padRight(10)} - $description');
    buffer.writeln('\nOpções globais:');
    buffer.writeln('  -h, --help    Mostra esta mensagem de ajuda.');

    sendOutput(buffer.toString());
  }
}
