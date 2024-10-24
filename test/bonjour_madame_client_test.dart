import 'package:bonjour_madame/bonjour_madame.dart';
import 'package:test/test.dart';

void main() {
  group('Bonjour Madame Client Test', () {
    late final BonjourMadameClient client;

    setUpAll(() {
      client = BonjourMadameClient(
          defaultHeaders: {'User-Agent': 'BonjourMadameClient/Test'});
    });

    test('Get all posts from the client', () async {
      final List<Post> posts = await client.posts.all();

      expect(posts, isA<List<Post>>());
    });

    test('Most recent', () async {
      final Post post = await client.posts.mostRecent;

      expect(post, isA<Post>());
    });
  });
}
