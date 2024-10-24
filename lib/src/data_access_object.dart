import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:rss_dart/dart_rss.dart';

import 'exceptions/bonjour_madame_exception.dart';
import 'resource.dart';

part 'dao/post_data_access_object.dart';

/// Base type for handling data transformation
@immutable
sealed class DataAccessObject<R extends Resource> {
  /// The [Client] implementation to use for http request
  final Client _client;

  /// The headers to apply to every request
  final Map<String, String> _defaultHeaders;

  /// The base url for the API
  final String _baseUrl;

  const DataAccessObject._(
    this._client,
    this._defaultHeaders,
    this._baseUrl,
  );
}
