import 'package:http/http.dart';

/// A client allowing to fetch data from BonjourMadame feed
class BonjourMadameClient {
  /// The default headers to apply to every request
  final Map<String, String> _defaultHeaders;

  /// The inner client to be used for the request
  final Client _client;

  BonjourMadameClient._({
    final Client? client,
    final Map<String, String>? defaultHeaders,
  })  : _client = client ?? Client(),
        _defaultHeaders = defaultHeaders ?? const <String, String>{};

  /// Create a client instance
  factory BonjourMadameClient(
      {final Client? client, final Map<String, String>? defaultHeaders}) {
    return BonjourMadameClient._(
        client: client, defaultHeaders: defaultHeaders);
  }
}