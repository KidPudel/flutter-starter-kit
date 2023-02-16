 both `const` and `final` **cannot be reassigned**, _but fields_ in a `final` object, as long as they aren't `const` or `final` themselves, _can be reassigned (unlike `const`)_.


both `final` and const `keywords` are used to declare variables that cannot be reassigned once they are initialized. However, there are some differences between the two that are important to understand.

Here are a few key differences between final and const in Flutter/Dart:

1. **When the value is determined:** The main difference between `final` and `const` _is when the value of the variable is determined_. A `final` variable's value can be determined at **runtime**, while a `const` variable's value must be determined at **compile-time**. This means that a const variable can only be assigned a value that is known at compile-time, while a `final` variable can be assigned a value at runtime.
2. **Usage:** _`const` variables are used to represent values that will never change during the entire lifecycle of the application_. Examples of such values include mathematical constants like pi, or string literals that are used throughout the app. _`final` variables are used to represent values that can only be determined at runtime, but will not change after they are initialized_.

```dart
final int a = DateTime.now().year;
const int b = 2022;

print(a); // prints the current year (e.g., 2023)
print(b); // prints 2022
```

# Compare to Kotlin

In Kotlin, the val and const `val` keywords are used to declare variables that cannot be reassigned once they are initialized. The `val` keyword is similar to `final` in Flutter/Dart, while `const val` is similar to `const`.
