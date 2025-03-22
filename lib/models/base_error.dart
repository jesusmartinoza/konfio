import 'package:flutter/material.dart';

/// Base error to show to user.
class BaseError {
  /// Internal code numbering to handle edge cases. For example: 123 -> Session expired.
  int? code;

  /// Message in a user-friendly way.
  String message = '';

  /// TLDR; of [message] written in a user-friendly way.
  String? title;

  /// Error classification(server, client, jsonException, etc.). This is for the developer.
  ErrorType type = ErrorType.unknown;

  BaseError(
      {this.code = 0,
      this.message = '',
      this.title,
      this.type = ErrorType.unknown});

  BaseError.fromException(Exception e) {
    debugPrint('EXCEPTION!');
    debugPrint(e.toString());

    message = e.toString();
  }

  BaseError.fromError(Error e) {
    debugPrint('ERROR!');
    debugPrint(e.toString());

    switch (e.runtimeType) {
      case TypeError _:
        code = 16;
        message = 'Error al interpretar respuesta del servidor.';
        type = ErrorType.unknown;
        return;
      default:
        code = 10;
        message = 'Error desconocido';
    }
  }
}

enum ErrorType { unknown, server, jsonDecode }
