import 'package:philiprehberger_string_ext/string_ext.dart';
import 'package:test/test.dart';

void main() {
  group('StringCaseExt', () {
    test('capitalized', () {
      expect('hello'.capitalized, equals('Hello'));
      expect(''.capitalized, equals(''));
      expect('H'.capitalized, equals('H'));
    });

    test('titleCase', () {
      expect('hello world'.titleCase, equals('Hello World'));
      expect('HELLO WORLD'.titleCase, equals('Hello World'));
    });

    test('camelCase', () {
      expect('hello world'.camelCase, equals('helloWorld'));
      expect('hello_world'.camelCase, equals('helloWorld'));
      expect('Hello-World'.camelCase, equals('helloWorld'));
      expect(''.camelCase, equals(''));
    });

    test('snakeCase', () {
      expect('helloWorld'.snakeCase, equals('hello_world'));
      expect('Hello World'.snakeCase, equals('hello_world'));
      expect('hello-world'.snakeCase, equals('hello_world'));
    });

    test('kebabCase', () {
      expect('helloWorld'.kebabCase, equals('hello-world'));
      expect('Hello World'.kebabCase, equals('hello-world'));
    });

    test('pascalCase', () {
      expect('hello world'.pascalCase, equals('HelloWorld'));
      expect('hello_world'.pascalCase, equals('HelloWorld'));
      expect('helloWorld'.pascalCase, equals('HelloWorld'));
      expect('HELLO-WORLD'.pascalCase, equals('HelloWorld'));
      expect(''.pascalCase, equals(''));
      expect('  '.pascalCase, equals(''));
    });
  });
}
