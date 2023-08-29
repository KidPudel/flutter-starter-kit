Persistent storage in our phone that is going to be maintained through app's start.  

To use it, import `shared_preferences ^2.2.0`  

```dart
final pref = await SharedPreferences.getInstance();
```

To save something
```dart
pref.setBool("logged_in", true);
```
To get something
```dart
pref.getBool("logged_in");
```
To remove something
```dart
pref.remove("logged_in");
```
