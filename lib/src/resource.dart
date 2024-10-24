import 'package:meta/meta.dart';
import 'package:rss_dart/dart_rss.dart';

import 'utils.dart';

part 'resources/post.dart';

/// Base type for all API resources
@immutable
sealed class Resource {
  const Resource._fromRssItem(final RssItem rssItem);
}
