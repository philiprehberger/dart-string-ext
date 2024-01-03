import 'package:philiprehberger_string_ext/string_ext.dart';
import 'package:test/test.dart';

void main() {
  group('StringManipulationExt', () {
    test('truncate with ellipsis', () {
      expect('Hello World'.truncate(5), equals('Hello...'));
      expect('Hello'.truncate(10), equals('Hello'));
    });

    test('truncate with custom ellipsis', () {
      expect('Hello World'.truncate(5, ellipsis: '…'), equals('Hello…'));
    });

    test('mask characters', () {
      expect('4111111111111111'.mask(start: 4, end: 12), equals('4111********1111'));
    });

    test('mask from start', () {
      expect('secret'.mask(end: 4), equals('****et'));
    });

    test('reversed', () {
      expect('hello'.reversed, equals('olleh'));
      expect(''.reversed, equals(''));
    });

    test('words', () {
      expect('hello world foo'.words, equals(['hello', 'world', 'foo']));
      expect('  spaced  out  '.words, equals(['spaced', 'out']));
    });
  });
}
