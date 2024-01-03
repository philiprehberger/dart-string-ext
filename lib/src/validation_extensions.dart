/// Extension methods for string validation.
extension StringValidationExt on String {
  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static final _urlRegex = RegExp(
    r'^https?://[^\s/$.?#].[^\s]*$',
    caseSensitive: false,
  );

  /// Whether this string is a valid email address.
  ///
  /// ```dart
  /// 'user@example.com'.isEmail // => true
  /// 'invalid'.isEmail         // => false
  /// ```
  bool get isEmail => _emailRegex.hasMatch(this);

  /// Whether this string is a valid URL.
  ///
  /// ```dart
  /// 'https://example.com'.isUrl // => true
  /// ```
  bool get isUrl => _urlRegex.hasMatch(this);

  /// Whether this string contains only numeric characters.
  ///
  /// ```dart
  /// '12345'.isNumeric // => true
  /// '12.34'.isNumeric // => false
  /// ```
  bool get isNumeric => isNotEmpty && RegExp(r'^[0-9]+$').hasMatch(this);

  /// Whether this string is empty or contains only whitespace.
  ///
  /// ```dart
  /// '  '.isBlank  // => true
  /// 'hi'.isBlank  // => false
  /// ```
  bool get isBlank => trim().isEmpty;
}
