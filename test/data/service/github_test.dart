import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  /// hook:
  setUp(() {
    print('Current Dir: ${Directory.current.toString()}');
    // Loading from a file synchronously.
    dotenv.testLoad(fileInput: File('test/.env').readAsStringSync());

    var token = dotenv.get('GITHUB_API_TOKEN');
    print('api token: ${token}');
  });

  /// get
  test('test: 1', () async {
    /// todo:
  });
}
