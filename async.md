# Future
The result of an asynchronous computation.
An asynchronous computation cannot provide a result immediately when it is started, unlike a synchronous computation which does compute a result immediately by either returning a value or by throwing. An _asynchronous computation may need to wait for something external to the program_ (reading a file, querying a database, fetching a web page) which takes time. _Instead of blocking all computation until the result is available, the asynchronous computation immediately returns a `Future` which will eventually "complete" with the result_.

# Asynchronous programming
To perform an asynchronous computation, you use an `async` function which always produces a future. Inside such an asynchronous function, _you can use the `await` operation to delay execution until another asynchronous computation has a result_. While execution of the _awaiting function is delayed, **the program is not blocked**, and can continue doing other things_.

---

When you call a function without using `async` and `await`, the function executes synchronously. This means that the function will block the execution of the calling code until the function has completed its task.

On the other hand, when you call a function using async and await, the function executes asynchronously. This means that the function does not block the execution of the calling code, allowing other code to be executed while the function is still running.

Here's an example to illustrate the difference:

```dart
Copy code
import 'dart:async';

void main() {
  print('Before calling longRunningTask');
  longRunningTask();
  print('After calling longRunningTask');
}

Future<void> longRunningTask() async {
  print('Task started');
  await Future.delayed(Duration(seconds: 3));
  print('Task completed');
}
```
In the example above, the longRunningTask() function simulates a long-running task by waiting for 3 seconds before printing "Task completed". When we call this function without using async and await, the output will be:
```
Copy code
Before calling longRunningTask
Task started
Task completed
After calling longRunningTask
As you can see, the execution of the calling code is blocked until the function has completed its task.
```
However, if we call the function using async and await like this:

```dart
import 'dart:async';

void main() async {
  print('Before calling longRunningTask');
  await longRunningTask();
  print('After calling longRunningTask');
}

Future<void> longRunningTask() async {
  print('Task started');
  await Future.delayed(Duration(seconds: 3));
  print('Task completed');
}
```
The output will be:

```
Before calling longRunningTask
Task started
After calling longRunningTask
Task completed
```
As you can see, the execution of the calling code is not blocked, and the message "After calling longRunningTask" is printed before the task completes.

