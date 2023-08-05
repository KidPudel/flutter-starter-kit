# Why BloC?
1. Structually organized and easy to use
2. Recommended (suits) everywhere, small, medium and big projects
3. Code is easy testable

# Core concepts
## Stream - asynchronous _stream_ of data
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


## Cubit and Bloc
Cubit is a small/minimal part of bloc (bloc **extends** cubit)
![image](https://github.com/KidPudel/flutter-starter-kit/assets/63263301/1ab7eb83-a070-475b-9ee4-bcad922f98cf)
What is cubit??

how cubit work

how cubit acts as a stream
