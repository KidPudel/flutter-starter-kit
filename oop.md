# Classes and constructors

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

You might use the `Spacecraft` class like this:


```dart
var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
voyager.describe();

var voyager3 = Spacecraft.unlaunched('Voyager III');
voyager3.describe();
```

# Abstract classes
abstract class is a class _that cannot be instantiated directly_, but _can be used as a base class for other classes_.   
Abstract classes are defined using the `abstract` keyword in the class declaration.

Abstract classes _are used to define a common interface_ for a group of related classes.

```dart
abstract class Animal {
  void makeSound();
}

class Cat implements Animal {
  void makeSound() {
    print('Meow!');
  }
}

class Dog implements Animal {
  void makeSound() {
    print('Woof!');
  }
}
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
creating interfaces for repositories is a common practice in software development. Here are some reasons why:

- Abstraction: By creating an interface for a repository, you are abstracting away the implementation details of the repository. This allows you to switch out the actual implementation of the repository without affecting the rest of the code that depends on it.

- Testability: When you create an interface for a repository, you can easily mock the repository in your unit tests. This allows you to test your code in isolation without having to depend on the actual implementation of the repository.

- Separation of Concerns: By creating an interface for a repository, you are separating the responsibilities of the repository from the rest of your code. This makes your code more modular and easier to maintain.

- Dependency Injection: If you are using a dependency injection framework like Dagger or Koin, creating an interface for a repository makes it easier to inject the repository into your code.

# Singleton class

## factory constructor

factory constructor, which is a special **_type of constructor that returns an instance of a class_**. Unlike a regular constructor, which always returns a new instance of the class, _a `factory` constructor can return an instance of a different class, or even a previously created instance of the same class_.

```dart
class MySingleton {
  static final MySingleton _singleton = MySingleton._internal();
  
  factory MySingleton() {
    return _singleton;
  }
  
  MySingleton._internal();
  
  void sayHello() {
    print('Hello, world!');
  }
}

void main() {
  var mySingleton = MySingleton();
  mySingleton.sayHello(); // prints 'Hello, world!'

  var myOtherSingleton = MySingleton();
  print(mySingleton == myOtherSingleton); // prints 'true'
}

```


more info here -> [INFO](https://dart.dev/samples)
