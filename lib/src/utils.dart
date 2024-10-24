import 'package:intl/intl.dart';

/// [DateFormat] for the rfc822
final DateFormat rfc822DateFormat = DateFormat('EEE, dd MMM y H:m:s Z');

/// Allow to parse a rfc822 to a [DateTime]
DateTime parseRfc822Date(final String date) {
  return DateTime.parse(rfc822DateFormat.parse(date).toIso8601String());
}
