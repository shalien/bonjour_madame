part of '../resource.dart';

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

  const Post._({
    required this.title,
    required this.link,
    required this.categories,
    required this.guid,
    required this.image,
    required this.pubDate,
  }) : super._();

  Post._fromRssItem(super.rssItem)
      : title = rssItem.title!,
        link = Uri.parse(rssItem.link!),
        categories =
            rssItem.categories.map((category) => category.value).toList(),
        guid = Uri.parse(rssItem.guid!),
        image = Uri.parse(rssItem.content!.images.first.split('?').first),
        pubDate = DateTime.parse(rssItem.pubDate!),
        super._fromRssItem();

  factory Post.fromRssItem(final RssItem rssItem) => Post._fromRssItem(rssItem);
}
