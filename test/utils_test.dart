import 'package:bonjour_madame/src/utils.dart';
import 'package:test/test.dart';

void main() {
  group('Test utils functions', () {
    test('Rss pubDate parsing', () {
      final String testDate = 'Thu, 10 Oct 2024 08:00:34 +0000';

      final DateTime parsedDate = parseRfc822Date(testDate);

      expect(parsedDate.day, 10);
      expect(parsedDate.weekday, DateTime.thursday);
      expect(parsedDate.month, DateTime.october);
      expect(parsedDate.month, 10);
      expect(parsedDate.year, 2024);
      expect(parsedDate.hour, 8);
      expect(parsedDate.minute, 0);
      expect(parsedDate.second, 34);

      /// We skip the timezone because cloud based worker doesn't have always the same as us
      //    expect(parsedDate.timeZoneOffset, Duration(hours: 2));
    });
  });
}
