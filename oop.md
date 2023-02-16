# Class

```dart
class Spacecraft {
  String name;
  DateTime? launchDate;

  // Read-only non-final property
  int? get launchYear => launchDate?.year;

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  // Method.
  void describe() {
    print('Spacecraft: $name');
    // Type promotion doesn't work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}
```

# Enums
Enums are a way of enumerating a predefined set of values or instances in a way which ensures that there cannot be any other instances of that type.

Here is an example of a simple enum that defines a simple list of predefined planet types:

`enum PlanetType { terrestrial, gas, ice }`

# Interface

Dart has **no interface keyword**. Instead, **all classes implicitly define an interface**.  
Therefore, you can implement _any_ class by using `implements` instead of `extends`.





```dart
class MockSpaceship implements Spacecraft {
  // ···
}
```
