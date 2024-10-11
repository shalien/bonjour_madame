import 'package:bonjour_madame/src/resource.dart';
import 'package:http/http.dart';

abstract base class DataAccessObject<R extends Resource> {
  final Client _client;

  final Map<String, String> _defaultClient;

  final String _baseUrl;

  const DataAccessObject._(
    this._client,
    this._defaultClient,
    this._baseUrl,
  );

  R fromRssItem(final RssItem);
}
