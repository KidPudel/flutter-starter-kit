When you call a function without using async and await, the function executes synchronously. This means that the function will block the execution of the calling code until the function has completed its task.

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
```
Task completed
As you can see, the execution of the calling code is not blocked, and the message "After calling longRunningTask" is printed before the task completes.

