import 'package:bonjour_madame/bonjour_madame.dart';
import 'package:http/http.dart';
import 'package:rss_dart/dart_rss.dart';
import 'package:test/test.dart';

void main() {
  group('Post rss parsing', () {
    List<RssItem>? rssItems;

    setUp(() async {
      var response = await get(Uri.parse('https://bonjourmadame.fr/feed/'));

      rssItems = RssFeed.parse(response.body).items;
    });

    test('Parse a post', () async {
      if (rssItems == null || rssItems!.isEmpty) {
        fail('No post to tests !');
      }

      final Post post = Post.fromRssItem(rssItems!.first);

      expect(post, isA<Post>());
      expect(post.title, isNotEmpty);
    });
  });
}
