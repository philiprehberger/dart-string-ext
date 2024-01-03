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
}
