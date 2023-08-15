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
<img src="https://github.com/KidPudel/flutter-starter-kit/assets/63263301/1ab7eb83-a070-475b-9ee4-bcad922f98cf" alt="accessiblity" width="500"></img>  
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
<img src="https://github.com/KidPudel/flutter-starter-kit/assets/63263301/0a7b384f-37f6-4975-971c-7bea7676787b" alt="accessiblity" width="500"></img>

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


# Widget components 
> Note: all components work with cubit and bloc, because bloc is the cubit
## `BlocProvider`: widget that nests and lets access a bloc/cubit in a tree and sends a stream of data
**Bloc Provider provides a single instance of a some BloC class (that is lazy by default to create only when asked and closing block automatically) to all of Bloc Providers Widget children.**  

This component is responsible for providing the BLoC instances to the widget tree below it. It acts as the top-level entry point for the BLoC hierarchy. With BlocProvider, you can inject BLoC instances into different parts of your app and share the same instance throughout the widget tree.
### Accessibility
**Bloc instance will only available to the its bloc provider children that has information in BuildContext**  
<img src="https://github.com/KidPudel/flutter-starter-kit/assets/63263301/754144f3-c7a0-4b01-b552-e0f5e64f9ab6" alt="accessiblity" width="500"></img>  
**To access bloc use BuildContext**  
<img src="https://github.com/KidPudel/flutter-starter-kit/assets/63263301/274099d7-f5c1-419f-abbe-4e966dda2b6f" alt="accessiblity" width="500"></img>  
**lazy by default to create only when asked and closing block automatically**  
<img src="https://github.com/KidPudel/flutter-starter-kit/assets/63263301/f12163da-5033-419e-bdf1-9f5107d4f9cb" alt="accessiblity" width="500"></img>  
**When a new portion of a tree is created, build context is different, so we need to add a value to the provider**  
<img src="https://github.com/KidPudel/flutter-starter-kit/assets/63263301/9a427ced-9a09-4b3e-8c49-46a4516cc350" alt="accessiblity" width="500"></img>  

```dart
import 'package:bloc/bloc.dart';

part 'boats_state.dart';

class BoatsCubit extends Cubit<BoatsState> {
  BoatsCubit() : super(BoatsState(boatsSent: 0));

  void sendBoat() => emit(BoatsState(boatsSent: state.boatsSent + 1));
  void returnBoat() => emit(BoatsState(boatsSent: state.boatsSent - 1));
}

part of 'boats_cubit.dart';

class BoatsState {
  int boatsSent;

  BoatsState({
    required this.boatsSent,
  });
}

```
This is a BlocProvider
now we need to embed it into a widget tree  
```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BoatsCubit>(
      create: (context) => BoatsCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
```
And trigger changes just call its method by accessing build context

```dart
floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<BoatsCubit>(context).sendBoat();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
```

**But how do we rebuild the UI element itself?? - _Using BlocBuilder_**


## `BlocBuilder`: listens to the events and rebuild
Is listener to changes and rebuilds UI  
<img src="https://github.com/KidPudel/flutter-starter-kit/assets/63263301/0cf904fb-45d0-431d-b012-6d906e7f116f" alt="accessiblity" width="500"></img>  

### Best practice
rebuilding a big part of the UI is expensive, so it is best to wrap a small part that is necessary  
<img src="https://github.com/KidPudel/flutter-starter-kit/assets/63263301/5750c9f1-4924-4bf6-9843-0c3fc5cde643" alt="accessiblity" width="500"></img>  
```dart
Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
        BlocBuilder<BoatsCubit, BoatsState>(builder: (context, state) {
            return Text(
                '${state.boatsSent}',
                style: Theme.of(context).textTheme.headlineMedium,
            );
        }),
    ]
)
```
Also you can use conditions like that:
```dart
BlocBuilder<BoatsCubit, BoatsState>(builder: (context, state) {
    if (state.boatsSent < 0) {
        return Text(
            'oh no, we have ${state.boatsSent} boats sent, we need to catch up',
            style: Theme.of(context).textTheme.headlineMedium,
        );
    else {
          return Text(
              'oh no, we have ${state.boatsSent} boats sent, we need to catch up',
              style: Theme.of(context).textTheme.headlineMedium,
        );
    }   
}),
```

---

`BlocBuilder` is a widget that listens to changes in a specific BLoC's state and rebuilds its child widget whenever the state changes. It takes a BLoC and a builder function as arguments, allowing you to update the UI based on the new state emitted by the BLoC.

## `BlocListener`: listens to the event and invoke callback
Is listener to changes and invokes a callback functions that is called _**once** per state_, so it suitable for things like showing snackbar or navigate to the screen because again it is called once per state, so it won't be called 10 times at once, which you definitely don't want.  
![image](https://github.com/KidPudel/flutter-starter-kit/assets/63263301/afbfefc7-94c4-48ea-ab63-096e1aa35c16)

Similar to `BlocBuilder`, `BlocListener` is a widget that listens to changes in a BLoC's state. However, instead of rebuilding its child widget, it invokes a callback function whenever the state changes. This is useful when you need to perform side effects or actions based on certain state changes, such as showing a snackbar or navigating to a new screen.

Using these components together, you can effectively implement the BLoC pattern in your Flutter application, promoting better separation of concerns and improved maintainability.

## `BlocConsumer`: Combination of `BlocBuilder` and `BlocListener`
![image](https://github.com/KidPudel/flutter-starter-kit/assets/63263301/ed3674bb-b475-4136-a7d3-1782539c65e0)  
```dart
child: BlocConsumer<BoatsCubit, BoatsState>(
                builder: (context, boatsState) {
                  return Text(
                    '${boatsState.boatsSent}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
                listener: (context, boatsState) {
                  if (boatsState.boatsSent > 2) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('great'),
                      duration: Duration(milliseconds: 500),
                    ));
                  }
                },
              ),
```

# Usage
we need to change a theme in the app on press, so meaning, give function and receive a stream
```dart
class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false)
  void switchTheme() => emit(!state);
}
```
then we need to access it in a widget tree, so use `BlocProvider` or `MultipleBlocProvider`
```dart
MutlipleBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => ThemeCubit()
    )
    child:
      ...
  ]
)
```

now to call cubit:
```dart
context.read<ThemeCubit>().switchTheme();
```

and to acutally access it use `BlocBuilder`
```dart
child:
  BlocBuilder<ThemeBloc, bool>(
    builder: (context) => Text((state == true) ? "changedToTrue" : "ChangedToFalse")
  )
```

And the same applies for `Bloc`
```dart
sealed class UserEvent {}
final class UserLogIn extends UserEvent {}
final class UserLogOut extends UserEvent {}

```
```dart
enum UserStatus { isLogging, isLoggedIn, isLoggingOut, isLoggedOut }

```
