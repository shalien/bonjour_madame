import 'package:http/http.dart';
import 'package:meta/meta.dart';

/// A custom exception to handle http errors from bonjourmadame
@immutable
final class BonjourMadameException implements Exception {
  /// the http statusCode
  final int statusCode;

  /// The reasonPhrase if any
  final String? reasonPhrase;

  /// Shorthand for confort
  String? get message => reasonPhrase;

  /// Create the exception from a [Response]
  BonjourMadameException._fromResponse(final Response response)
      : statusCode = response.statusCode,
        reasonPhrase = response.reasonPhrase;

  /// Create the exception from a [Response]
  factory BonjourMadameException.fromResponse(final Response response) =>
      BonjourMadameException._fromResponse(response);
}
