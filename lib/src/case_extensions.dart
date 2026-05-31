/// Extension methods for string case conversion.
extension StringCaseExt on String {
  /// Capitalize the first letter.
  ///
  /// ```dart
  /// 'hello'.capitalized // => 'Hello'
  /// ```
  String get capitalized {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  /// Convert to Title Case (capitalize first letter of each word).
  ///
  /// ```dart
  /// 'hello world'.titleCase // => 'Hello World'
  /// ```
  String get titleCase {
    if (isEmpty) return this;
    return split(RegExp(r'\s+')).map((w) => w.isEmpty ? w : w[0].toUpperCase() + w.substring(1).toLowerCase()).join(' ');
  }

  /// Convert to camelCase.
  ///
  /// ```dart
  /// 'hello world'.camelCase   // => 'helloWorld'
  /// 'hello_world'.camelCase   // => 'helloWorld'
  /// 'Hello-World'.camelCase   // => 'helloWorld'
  /// ```
  String get camelCase {
    if (isEmpty) return this;
    final words = _splitWords();
    if (words.isEmpty) return '';
    return words.first.toLowerCase() +
        words.skip(1).map((w) => w.isEmpty ? '' : w[0].toUpperCase() + w.substring(1).toLowerCase()).join();
  }

  /// Convert to snake_case.
  ///
  /// ```dart
  /// 'helloWorld'.snakeCase // => 'hello_world'
  /// 'Hello World'.snakeCase // => 'hello_world'
  /// ```
  String get snakeCase {
    if (isEmpty) return this;
    return _splitWords().map((w) => w.toLowerCase()).join('_');
  }

  /// Convert to kebab-case.
  ///
  /// ```dart
  /// 'helloWorld'.kebabCase // => 'hello-world'
  /// 'Hello World'.kebabCase // => 'hello-world'
  /// ```
  String get kebabCase {
    if (isEmpty) return this;
    return _splitWords().map((w) => w.toLowerCase()).join('-');
  }

  /// Convert to PascalCase.
  ///
  /// ```dart
  /// 'hello world'.pascalCase  // => 'HelloWorld'
  /// 'hello_world'.pascalCase  // => 'HelloWorld'
  /// 'helloWorld'.pascalCase   // => 'HelloWorld'
  /// ```
  String get pascalCase {
    if (isEmpty) return this;
    final words = _splitWords();
    if (words.isEmpty) return '';
    return words
        .map((w) =>
            w.isEmpty ? '' : w[0].toUpperCase() + w.substring(1).toLowerCase())
        .join();
  }

  List<String> _splitWords() {
    // Split on spaces, underscores, hyphens, and camelCase boundaries
    return replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'),
      (m) => '${m[1]} ${m[2]}',
    ).split(RegExp(r'[\s_\-]+')).where((w) => w.isNotEmpty).toList();
  }
}
