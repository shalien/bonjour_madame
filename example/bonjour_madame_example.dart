import 'dart:io';

import 'package:bonjour_madame/bonjour_madame.dart';
import 'package:http/http.dart';

/// This example fetch the last posted "madame"
void main() async {
  /// We're adding a custom User-Agent to the client
  final BonjourMadameClient bonjourMadameClient = BonjourMadameClient(
      defaultHeaders: {'User-Agent': 'BonjourMadameClient/1.0.0'});

  try {
    /// [mostRecent] is a custom shorthand in the library to get the first (last item add) to the feed
    final Post mostRecent = await bonjourMadameClient.posts.mostRecent;

    stdout.write('''
    __ Most recent "Bonjour Madame" Post __
    Title: ${mostRecent.title}
    Date: ${mostRecent.pubDate.toLocal()}
    Link: ${mostRecent.link}
    Image: ${mostRecent.image}
    ''');
  } on ClientException catch (cex) {
    stderr.writeln('Something went wrong : ${cex.message}');
    exit(-1);
  } on BonjourMadameException catch (bex) {
    stderr.writeln(
        'Server response is an error : ${bex.statusCode} ${bex.reasonPhrase}');
    exit(-1);
  }

  exit(0);
}
