/*
  Arquivo: command_runner/lib/src/command_exception.dart
*/

class CommandException implements Exception {
  final String message;
  final int? statusCode;

  CommandException(this.message, {this.statusCode});

  @override
  String toString() {
    if (statusCode != null) {
      return 'CommandException (Código $statusCode): $message';
    }
    return 'CommandException: $message';
  }
}
