![bonjour_madame](https://gitlab.projetretro.io/shalien/bonjour_madame/-/raw/main/.assets/logo_large.png?ref_type=heads)

[bonjour_madame](https://pub.dev/bonjour_madame) is a library allowing to fetch data from the RSS feed of the french erotic website [Bonjour Madame](https://bonjourmadame.fr).

[![pipeline status](https://gitlab.projetretro.io/shalien/bonjour_madame/badges/main/pipeline.svg)](https://gitlab.projetretro.io/shalien/bonjour_madame/-/commits/main)
[![coverage report](https://gitlab.projetretro.io/shalien/bonjour_madame/badges/main/coverage.svg)](https://gitlab.projetretro.io/shalien/bonjour_madame/-/commits/main)
[![Latest Release](https://gitlab.projetretro.io/shalien/bonjour_madame/-/badges/release.svg)](https://gitlab.projetretro.io/shalien/bonjour_madame/-/releases)

## Features

- Simple dart wrapper around the [Bonjour Madame](https://bonjourmadame.fr) rss feed
- Using the [http](https://pub.dev/http) package allowing to use it capacity to interface with native and/or custom http clients

## Getting started

Run 

```shell
dart pub add bonjour_madame
```

or add

```yml
    bonjour_madame: ^1.0.0
```

to your `pubspec.yaml` and run 

```shell
dart pub get
```

## Usage

```dart
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
```

## Known limitations

- Only allow to access the current post into the rss feed, this is a design choice
- Don't automatically cache fetched post
- Doesn't allow from parsing a specific url to extract data (aka: scrapping)

## Support This Project

[![Buy Me a Coffee](https://img.shields.io/badge/Buy_Me_a_Coffee-FFDD00?style=flat-square&logo=buy-me-a-coffee&logoColor=black)](https://www.buymeacoffee.com/shalien)
[![Ko-fi](https://img.shields.io/badge/Support-Ko--fi-29ABE0?style=flat-square&logo=ko-fi)](https://ko-fi.com/shalien)
[![Liberapay](https://img.shields.io/badge/Donate-Liberapay-F6C915?style=flat-square&logo=liberapay)](https://liberapay.com/shalien)
[![Open Collective](https://img.shields.io/badge/Donate-Open%20Collective-007EC6?style=flat-square&logo=open-collective)](https://opencollective.com/shalien)
[![Patreon](https://img.shields.io/badge/Support-Patreon-F96854?style=flat-square&logo=patreon)](https://patreon.com/shalien)
[![PayPal](https://img.shields.io/badge/Donate-PayPal-00457C?style=flat-square&logo=paypal)](https://paypal.me/oduparc)

## License

PROJETRETRO RESTRICTED LICENSE + AI (PRL + AI)

[license@projetretro.io](mailto:license@projetretro.io) - 2024

This license cover both the use of the project itself and the use or any parts of the code and/or assets composing the
project to which this license is attached in any fashion.

The product to which this license is granted is distributed "AS IS" and without any warranty of any kind, express or
implied.
The user and/or provider of the product to an end user assumes all risk of user, damage or injury.
The user and/or provider of the product to an end user is solely responsible for determining the suitability of this
product ofr it's intended use.

By using the product attached to this license, the user and/or provider of the product to an end user agrees to the
terms of this license.
If you do not agree to all the terms of this license, do not use the product.

This license is RESTRICTIVE, it's mean that any usage EXPRESSLY not authorized by said license is FORBIDDEN.

You must :

- Provide a complete copy of this license with any distribution of the product
- Not remove any copyright, trademark or patent notices from the product or any parts
- Provide an updated version of the license with any modification of the product AS SOON AS POSSIBLE and CLEARLY NOTIFY
  the user of the modification

It's EXPRESSLY FORBIDDEN to :

- Re-license the project or any parts under any others licenses
- Use the project or any parts for any commercial (meaning generating revenue) purposes WITHOUT written authorization
  from the project owner
    - Open source projects donations are excluded from this restriction
- Use the project or any parts of the code and/or assets composing the project to which this license is attached in any
  fashion to train, generate, feed or any kind of action related to LLM or any AI related technologies

Failing to comply to the license term in a deliberate way will result in the immediate termination of the license and a
fee of 1% of the total revenue generated by the product using the project to which this license is attached in any
fashion to the author(s) of the project and/or legal actions.

## Additional information

### Legal

"Bonjour Madame", the logo, the icon are properties of https://bonjourmadame.fr team. They're only use here for illustration purposes.
This project, it's code or/and any aspect is affiliated nor endorsed by said team.


