Named parameters allows you:
1. To control your parameters e.g. make it required
2. name it when invoking function and passing parameters


```dart
const Constants({required Widget child, super.key}) : super(child: child);
```
allows you do this: 
```dart
void main() {
  runApp(
    Constants(
      child: Application(),
    ),
  );
}

```
