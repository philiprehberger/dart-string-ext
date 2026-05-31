/// Extension methods for string manipulation.
extension StringManipulationExt on String {
  /// Truncate to [maxLength] and append [ellipsis] if truncated.
  ///
  /// ```dart
  /// 'Hello World'.truncate(5) // => 'Hello...'
  /// ```
  String truncate(int maxLength, {String ellipsis = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}$ellipsis';
  }

  /// Mask characters from [start] to [end] with [char].
  ///
  /// ```dart
  /// '4111111111111111'.mask(start: 4, end: 12) // => '4111********1111'
  /// ```
  String mask({int start = 0, int? end, String char = '*'}) {
    final maskEnd = end ?? length;
    if (start >= length || start >= maskEnd) return this;
    final clampedEnd = maskEnd > length ? length : maskEnd;
    return substring(0, start) +
        char * (clampedEnd - start) +
        substring(clampedEnd);
  }

  /// Reverse the string.
  ///
  /// ```dart
  /// 'hello'.reversed // => 'olleh'
  /// ```
  String get reversed => split('').reversed.join();

  /// Split into words (by whitespace).
  ///
  /// ```dart
  /// 'hello world foo'.words // => ['hello', 'world', 'foo']
  /// ```
  List<String> get words =>
      split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();

  /// Extracts initials from the string (first letter of each word, uppercase).
  ///
  /// ```dart
  /// 'John Doe'.initials; // 'JD'
  /// 'alice bob charlie'.initials; // 'ABC'
  /// ```
  String get initials {
    if (trim().isEmpty) return '';
    return trim()
        .split(RegExp(r'\s+'))
        .where((w) => w.isNotEmpty)
        .map((w) => w[0].toUpperCase())
        .join();
  }

  /// Wraps text at [width] characters, breaking at word boundaries.
  ///
  /// ```dart
  /// 'The quick brown fox jumps'.wrap(10);
  /// // 'The quick\nbrown fox\njumps'
  /// ```
  String wrap(int width) {
    if (width <= 0 || length <= width) return this;
    final words = split(RegExp(r'\s+'));
    final lines = <String>[];
    var currentLine = StringBuffer();

    for (final word in words) {
      if (currentLine.isEmpty) {
        currentLine.write(word);
      } else if (currentLine.length + 1 + word.length <= width) {
        currentLine.write(' $word');
      } else {
        lines.add(currentLine.toString());
        currentLine = StringBuffer(word);
      }
    }
    if (currentLine.isNotEmpty) {
      lines.add(currentLine.toString());
    }
    return lines.join('\n');
  }

  /// Split into lines (handles `\n`, `\r\n`, and `\r` separators).
  ///
  /// ```dart
  /// 'a\nb\r\nc'.lines // => ['a', 'b', 'c']
  /// ```
  List<String> get lines =>
      isEmpty ? const <String>[] : split(RegExp(r'\r\n|\r|\n'));

  /// Number of lines in the string. Empty string returns 0.
  ///
  /// ```dart
  /// 'a\nb\nc'.lineCount // => 3
  /// ''.lineCount        // => 0
  /// ```
  int get lineCount => lines.length;

  /// Number of whitespace-separated non-empty tokens.
  ///
  /// ```dart
  /// 'hello world foo'.wordCount // => 3
  /// '   '.wordCount             // => 0
  /// ```
  int get wordCount => words.length;

  /// Collapse runs of whitespace into a single space and trim ends.
  ///
  /// ```dart
  /// '  hi   there  '.squish // => 'hi there'
  /// ```
  String get squish => trim().replaceAll(RegExp(r'\s+'), ' ');
}
