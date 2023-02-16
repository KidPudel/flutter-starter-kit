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

You might use the Spacecraft class like this:


```dart
var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
voyager.describe();

var voyager3 = Spacecraft.unlaunched('Voyager III');
voyager3.describe();
```

# Enums
Enums are a way of enumerating a predefined set of values or instances in a way which ensures that there cannot be any other instances of that type.

Here is an example of a simple enum that defines a simple list of predefined planet types:

```dart
enum PlanetType { terrestrial, gas, ice }
```

# Inheritance
Dart has single inheritance.

```dart
class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.launchDate, this.altitude);
}
```


# Mixins
Mixins are a way of reusing code in multiple class hierarchies. The following is a mixin declaration:

```dart
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}
```

To add a mixin’s capabilities to a class, just extend the class with the mixin.

```dart
class PilotedCraft extends Spacecraft with Piloted {
  // ···
}
```


PilotedCraft now has the astronauts field as well as the `describeCrew()` method.

# Interface

Dart has **no interface keyword**. Instead, **all classes implicitly define an interface**.  
Therefore, you can implement _any_ class by using `implements` instead of `extends`.


```dart
class MockSpaceship implements Spacecraft {
  // ···
}
```


more info here -> [INFO](https://dart.dev/samples)
