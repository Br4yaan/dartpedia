/*
  ==============================================================
  Projeto: dartpedia001
  Pacote: command_runner
  Arquivo: lib/src/logger_config.dart
  Versão: 0.0.0
  Descritivo do Código:
    - Lição 12: Configuração centralizada de logs (Logger) gravando no console e em arquivo app.log.
  ==============================================================
*/

import 'dart:io';
import 'package:logging/logging.dart';

class AppLogger {
  static final Logger _logger = Logger('DartpediaLogger');

  static Logger get instance => _logger;

  /// Configura os níveis de log e os manipuladores de saída (console + arquivo)
  static void setup({Level level = Level.ALL}) {
    Logger.root.level = level;

    final logFile = File('app.log');

    Logger.root.onRecord.listen((record) {
      final logMessage =
          '${record.time} [${record.level.name}] ${record.loggerName}: ${record.message}';

      // Saída 1: Console
      print(logMessage);

      // Saída 2: Arquivo local (app.log)
      try {
        logFile.writeAsStringSync('$logMessage\n', mode: FileMode.append);
      } catch (e) {
        print('Erro ao gravar log no arquivo: $e');
      }
    });
  }
}
