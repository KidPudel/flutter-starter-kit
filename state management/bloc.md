# Why BloC?
1. Structually organized and easy to use
2. Recommended (suits) everywhere, small, medium and big projects
3. Code is easy testable

# Core concepts
- **Stream** - asynchronous _stream_ of data
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
