part of '../resource.dart';

/// Represent a Bonjour Madame [Post] by a subset of a Rss item properties
@immutable
final class Post extends Resource {
  /// Title of the post
  final String title;

  /// Link of the post
  final Uri link;

  /// Time of the posting
  final DateTime pubDate;

  /// Category of the post
  final List<String?> categories;

  /// The [guid] of the post
  final Uri guid;

  /// Link to the image
  final Uri image;

  Post._fromRssItem(super.rssItem)
      : title = rssItem.title!,
        link = Uri.parse(rssItem.link!),
        categories =
            rssItem.categories.map((category) => category.value).toList(),
        guid = Uri.parse(rssItem.guid!),
        image = Uri.parse(rssItem.content!.images.first.split('?').first),
        pubDate = parseRfc822Date(rssItem.pubDate!),
        super._fromRssItem();

  /// Create a [Post] using data from a [RssItem]
  factory Post.fromRssItem(final RssItem rssItem) => Post._fromRssItem(rssItem);
}
