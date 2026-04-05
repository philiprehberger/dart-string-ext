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

    test('initials extracts first letters', () {
      expect('John Doe'.initials, 'JD');
    });

    test('initials handles multiple words', () {
      expect('alice bob charlie'.initials, 'ABC');
    });

    test('initials handles single word', () {
      expect('hello'.initials, 'H');
    });

    test('initials handles empty string', () {
      expect(''.initials, '');
    });

    test('wrap breaks at word boundaries', () {
      expect('The quick brown fox'.wrap(10), 'The quick\nbrown fox');
    });

    test('wrap returns original if within width', () {
      expect('short'.wrap(10), 'short');
    });

    test('wrap handles single long word', () {
      expect('abcdefghij'.wrap(5), 'abcdefghij');
    });

    test('wrap handles empty string', () {
      expect(''.wrap(10), '');
    });
  });
}
