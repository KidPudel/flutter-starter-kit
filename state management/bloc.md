# Why BloC?
1. Structually organized and easy to use
2. Recommended (suits) everywhere, small, medium and big projects
3. Code is easy testable

# Core concepts
## 1. Stream - asynchronous _stream_ of data
Stream functions marked with `async*` do not return a single value like `Future` `async`;
they produce a sequence of values over time, making them suitable for streaming data or producing large datasets incrementally.
```dart
Stream<int> countNumbers() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1)); // This is allowed but not necessary
    yield i;
  }
}
void main() async {
  Stream<int> stream = boatStream();
  stream.listen(receivedData)) {
  print(receivedData.toString())
  }
}
```
Why we need it?
from every interaction there could be a state coming, and it could go continuesly, therefore stream is better.
And sometimes we want a data when we decide, then `Future` and `async` is suitable.


## 2. Cubit and 3. Bloc
Cubit is a small/minimal part of bloc (bloc **extends** cubit)
![image](https://github.com/KidPudel/flutter-starter-kit/assets/63263301/1ab7eb83-a070-475b-9ee4-bcad922f98cf)  
Cubit is a streaming component that is based on functions that are called from the UI and then emits the result data in a stream
```dart
import 'package:bloc/bloc.dart';

class BoatsCubit extends Cubit<int> {
  BoatsCubit() : super(0);

  void sendBoat() => emit(state + 1);

  void sendShip() => emit(state + 2);

  void sendCruiser() {
    print("send big cruiser");
    emit(state + 3);
  }
}

void main() async {
  final boatsStream = BoatsCubit();

  boatsStream.stream.listen((event) {
    print(event);
  });

  boatsStream.sendBoat();
  boatsStream.sendShip();
  boatsStream.sendCruiser();

  boatsStream.close();
}
```

Blocs on the other hand are more advanced, they not only emit data in stream, they are also listening to the input stream
![image](https://github.com/KidPudel/flutter-starter-kit/assets/63263301/0a7b384f-37f6-4975-971c-7bea7676787b)
```dart
import 'package:bloc/bloc.dart';

enum BoatsEvent { increment, decrement }

class BoatsBloc extends Bloc<BoatsEvent, int> {
  BoatsBloc() : super(0);

  @override
  Stream<int> mapEventToState(BoatsEvent boatsEvent) async* {
    switch (boatsEvent) {
      case BoatsEvent.increment:
        yield state + 1;
        break;
      case BoatsEvent.decrement:
        yield state - 1;
        break;
    }
  }
}

void main() async {
  final boatsStream = BoatsBloc();

  boatsStream.stream.listen((event) {
    print(event);
  });

  // Notifies bloc of new event which triggers handler
  boatsStream.add(BoatsEvent.increment);
  boatsStream.add(BoatsEvent.decrement);
  boatsStream.add(BoatsEvent.increment);
  
  boatsStream.close();
}
```

## Usecase between cubit and bloc
When to use cubit?  
- Example with increment button, why would you need bloc with its stream listening? It's like a buldoser for digging a 10 centemeters hole, you just can use a showel, cubit.  
When to use bloc?  
- Example with weather app, you search for locations and tap each letter, cubit would be looking each time you change it for locations, bloc is a listener so it could call it every 4 words or 2 seconds or when we stop tapping, we can easily manage it in a stream.
