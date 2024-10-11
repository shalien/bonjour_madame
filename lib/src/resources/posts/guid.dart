/// Guid of a post
final class Guid {
  /// is the guid poiting a permalink
  final bool isPermalink;

  /// link of the guid;
  final Uri link;

  const Guid({required this.isPermalink, required this.link});
}
