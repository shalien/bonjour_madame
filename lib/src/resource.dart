import 'package:bonjour_madame/src/resources/posts/guid.dart';
import 'package:meta/meta.dart';
import 'package:rss_dart/dart_rss.dart';

part 'resources/post.dart';

@immutable
abstract base class Resource {
  const Resource._();

  const Resource._fromRssItem(final RssItem rssItem);
}
