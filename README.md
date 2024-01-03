# philiprehberger_string_ext

[![Tests](https://github.com/philiprehberger/dart-string-ext/actions/workflows/ci.yml/badge.svg)](https://github.com/philiprehberger/dart-string-ext/actions/workflows/ci.yml)
[![pub package](https://img.shields.io/pub/v/philiprehberger_string_ext.svg)](https://pub.dev/packages/philiprehberger_string_ext)
[![Last updated](https://img.shields.io/github/last-commit/philiprehberger/dart-string-ext)](https://github.com/philiprehberger/dart-string-ext/commits/main)

String extension methods for case conversion, truncation, masking, and validation

## Requirements

- Dart >= 3.6

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  philiprehberger_string_ext: ^0.1.0
```

Then run:

```bash
dart pub get
```

## Usage

```dart
import 'package:philiprehberger_string_ext/string_ext.dart';

print('hello world'.titleCase);   // Hello World
print('helloWorld'.snakeCase);    // hello_world
print('Hello World'.truncate(5)); // Hello...
print('user@example.com'.isEmail); // true
```

### Case Conversion

```dart
'hello'.capitalized    // => 'Hello'
'hello world'.titleCase // => 'Hello World'
'hello world'.camelCase // => 'helloWorld'
'helloWorld'.snakeCase  // => 'hello_world'
'helloWorld'.kebabCase  // => 'hello-world'
```

### Truncation & Masking

```dart
'Hello World'.truncate(5)                       // => 'Hello...'
'Hello World'.truncate(5, ellipsis: '…')        // => 'Hello…'
'4111111111111111'.mask(start: 4, end: 12)      // => '4111********1111'
'hello'.reversed                                 // => 'olleh'
'hello world foo'.words                          // => ['hello', 'world', 'foo']
```

### Validation

```dart
'user@example.com'.isEmail  // => true
'https://example.com'.isUrl // => true
'12345'.isNumeric           // => true
'  '.isBlank                // => true
```

## API

| Member | Type | Description |
|--------|------|-------------|
| `capitalized` | `String` | Capitalize the first letter |
| `titleCase` | `String` | Capitalize first letter of each word |
| `camelCase` | `String` | Convert to camelCase |
| `snakeCase` | `String` | Convert to snake_case |
| `kebabCase` | `String` | Convert to kebab-case |
| `truncate(maxLength, {ellipsis})` | `String` | Truncate with ellipsis |
| `mask({start, end, char})` | `String` | Mask characters in range |
| `reversed` | `String` | Reverse the string |
| `words` | `List<String>` | Split into words by whitespace |
| `isEmail` | `bool` | Whether string is a valid email |
| `isUrl` | `bool` | Whether string is a valid URL |
| `isNumeric` | `bool` | Whether string is numeric only |
| `isBlank` | `bool` | Whether string is empty or whitespace |

## Development

```bash
dart pub get
dart analyze --fatal-infos
dart test
```

## Support

If you find this project useful:

⭐ [Star the repo](https://github.com/philiprehberger/dart-string-ext)

🐛 [Report issues](https://github.com/philiprehberger/dart-string-ext/issues?q=is%3Aissue+is%3Aopen+label%3Abug)

💡 [Suggest features](https://github.com/philiprehberger/dart-string-ext/issues?q=is%3Aissue+is%3Aopen+label%3Aenhancement)

❤️ [Sponsor development](https://github.com/sponsors/philiprehberger)

🌐 [All Open Source Projects](https://philiprehberger.com/open-source-packages)

💻 [GitHub Profile](https://github.com/philiprehberger)

🔗 [LinkedIn Profile](https://www.linkedin.com/in/philiprehberger)

## License

[MIT](LICENSE)
