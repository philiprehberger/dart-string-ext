import 'package:philiprehberger_string_ext/string_ext.dart';
import 'package:test/test.dart';

void main() {
  group('StringValidationExt', () {
    test('isEmail validates correctly', () {
      expect('user@example.com'.isEmail, isTrue);
      expect('user+tag@example.co.uk'.isEmail, isTrue);
      expect('invalid'.isEmail, isFalse);
      expect('@example.com'.isEmail, isFalse);
      expect(''.isEmail, isFalse);
    });

    test('isUrl validates correctly', () {
      expect('https://example.com'.isUrl, isTrue);
      expect('http://example.com/path'.isUrl, isTrue);
      expect('not a url'.isUrl, isFalse);
      expect(''.isUrl, isFalse);
    });

    test('isNumeric validates correctly', () {
      expect('12345'.isNumeric, isTrue);
      expect('12.34'.isNumeric, isFalse);
      expect('abc'.isNumeric, isFalse);
      expect(''.isNumeric, isFalse);
    });

    test('isBlank validates correctly', () {
      expect(''.isBlank, isTrue);
      expect('  '.isBlank, isTrue);
      expect('hi'.isBlank, isFalse);
      expect(' hi '.isBlank, isFalse);
    });
  });
}
