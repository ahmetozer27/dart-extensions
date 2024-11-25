
---

# Dart Extension Methods

This project demonstrates how to use `extension` methods in the Dart programming language. Dart's `extension` feature allows you to add functionality to existing classes, making it easy to extend built-in types with custom methods or properties.

## Features

- **String Extensions**: Adds useful methods to the `String` class, such as capitalizing the first letter or checking if the string is a valid email.
- **Nullable String Extensions**: Adds extensions to nullable `String?` types, handling null checks while providing useful methods.

## Usage

### String Extensions

The following extensions like `capitalize` and `isValidEmail` are added to the `String` class:

- **`isNullOrEmpty`**: Checks if the string is null or empty.
- **`capitalize`**: Capitalizes the first letter of the string.
- **`isValidEmail`**: Validates if the string is a valid email address using a regular expression.

Example usage:

```dart
extension StringExtensions on String {
  bool get isNullOrEmpty => isEmpty;

  String capitalize() {
    if (isNullOrEmpty) return this;

    return "${this[0].toUpperCase()}${substring(1)}";
  }

  bool get isValidEmail {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
    );
    return emailRegex.hasMatch(this);
  }
}
```

#### Example:

```dart
void main() {
  String email = "test@example.com";
  print(email.isValidEmail);  // true
  print(email.capitalize());  // Test@example.com
}
```

### Nullable String Extensions

For nullable `String?` types, we can add methods that handle null values properly. The methods work the same way as for non-nullable strings, but with added null checks.

- **`isNullOrEmpty`**: Checks if the string is null or empty.
- **`capitalize`**: Capitalizes the first letter of the string, if not null.
- **`isValidEmail`**: Checks if the string is a valid email, if not null.

Example usage:

```dart
extension NullableStringExtensions on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  String? capitalize() {
    if (isNullOrEmpty) return this;
    return "${this![0].toUpperCase()}${this!.substring(1)}";
  }

  bool get isValidEmail {
    if (isNullOrEmpty) return false;
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
    );
    return emailRegex.hasMatch(this!);
  }
}
```

#### Example:

```dart
void main() {
  String? nullableEmail = "test@example.com";
  print(nullableEmail.isValidEmail);  // true
  print(nullableEmail?.capitalize());  // Test@example.com
}
```
---
