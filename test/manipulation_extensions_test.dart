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

    test('lines splits on \\n, \\r\\n, and \\r', () {
      expect('a\nb\nc'.lines, equals(['a', 'b', 'c']));
      expect('a\r\nb\r\nc'.lines, equals(['a', 'b', 'c']));
      expect('a\rb\rc'.lines, equals(['a', 'b', 'c']));
    });

    test('lines empty string returns empty list', () {
      expect(''.lines, isEmpty);
    });

    test('lines single line returns one element', () {
      expect('hello'.lines, equals(['hello']));
    });

    test('lineCount counts lines', () {
      expect(''.lineCount, equals(0));
      expect('a'.lineCount, equals(1));
      expect('a\nb\nc'.lineCount, equals(3));
      expect('a\r\nb'.lineCount, equals(2));
    });

    test('wordCount counts tokens', () {
      expect(''.wordCount, equals(0));
      expect('hello'.wordCount, equals(1));
      expect('hello world foo'.wordCount, equals(3));
      expect('  spaced   out  '.wordCount, equals(2));
      expect('   '.wordCount, equals(0));
    });

    test('squish collapses whitespace and trims', () {
      expect('  hi   there  '.squish, equals('hi there'));
      expect('hello'.squish, equals('hello'));
      expect(''.squish, equals(''));
      expect('   '.squish, equals(''));
      expect('a\tb\n c'.squish, equals('a b c'));
    });
  });
}
