# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.3.0] - 2026-05-30

### Added
- `pascalCase` getter for PascalCase conversion (complements existing `camelCase`/`snakeCase`/`kebabCase`)
- `lines` getter — splits on `\n`, `\r\n`, and `\r`
- `lineCount` getter — number of lines (0 for empty string)
- `wordCount` getter — number of whitespace-separated tokens
- `squish` — collapse whitespace runs into single spaces and trim ends

## [0.2.0] - 2026-04-04

### Added
- `initials` getter for extracting first letter of each word
- `wrap(int width)` method for word-boundary line wrapping

## [0.1.1] - 2026-04-03

### Fixed
- Primary barrel file now matches package name for pub.dev validation

## [0.1.0] - 2026-04-03

### Added
- Case conversion extensions: `capitalized`, `titleCase`, `camelCase`, `snakeCase`, `kebabCase`
- Manipulation extensions: `truncate()`, `mask()`, `reversed`, `words`
- Validation extensions: `isEmail`, `isUrl`, `isNumeric`, `isBlank`
- Zero external dependencies
