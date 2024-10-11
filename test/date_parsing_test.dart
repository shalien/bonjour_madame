import 'package:test/test.dart';

void main() {

  test('Parsing date into something dart can disgest', () {
    var date  ='Thu, 10 Oct 2024 08:00:34 +0000';

    var dateFormat = date.substring(5);

    DateTime dt = DateTime.parse(dateFormat);

    print(dt);

  });


}