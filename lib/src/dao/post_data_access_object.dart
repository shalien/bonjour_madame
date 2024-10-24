part of '../data_access_object.dart';

/// A [DataAccessObject] used to fetch [Post]
@immutable
final class PostDataAccessObject extends DataAccessObject<Post> {
  PostDataAccessObject._(super.client, super.defaultHeaders, super.baseUrl)
      : super._();

  /// Create a [PostDataAccessObject] to manipulate [Post]
  factory PostDataAccessObject(final Client client,
          final Map<String, String> defaultHeaders, final String baseUrl) =>
      PostDataAccessObject._(client, defaultHeaders, baseUrl);

  /// Return all the currently present [Post] in the feed
  Future<List<Post>> all() async {
    final Uri uri = Uri.parse(_baseUrl);

    late final Response response;

    try {
      response = await _client.get(uri, headers: _defaultHeaders);
    } catch (_) {
      rethrow;
    }

    if (response.statusCode == 200) {
      final RssFeed feed = RssFeed.parse(response.body);

      return List.from(feed.items.map(_fromRssItem));
    } else {
      throw BonjourMadameException.fromResponse(response);
    }
  }

  /// Return the  mostRecent (last added) [Post] in the feed
  Future<Post> get mostRecent async => (await all()).first;

  Post _fromRssItem(final RssItem rssItem) => Post.fromRssItem(rssItem);
}
