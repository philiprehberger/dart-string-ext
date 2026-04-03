import 'package:philiprehberger_string_ext/string_ext.dart';

void main() {
  // Case conversion
  print('hello world'.capitalized); // Hello world
  print('hello world'.titleCase);   // Hello World
  print('hello world'.camelCase);   // helloWorld
  print('helloWorld'.snakeCase);    // hello_world
  print('helloWorld'.kebabCase);    // hello-world

  // Manipulation
  print('Hello World'.truncate(5));              // Hello...
  print('4111111111111111'.mask(start: 4, end: 12)); // 4111********1111
  print('hello'.reversed);                        // olleh

  // Validation
  print('user@example.com'.isEmail); // true
  print('  '.isBlank);              // true
  print('12345'.isNumeric);         // true
}
