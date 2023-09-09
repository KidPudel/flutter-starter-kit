One way to pass data from child widget to parent widget is to use _callback function_.  
in parent pass a function to the child as a parameter to call in child widget which **sets parent's `_addresses` to the data from child widget**:  
```dart
MyChildWidget(callback: (List<String> addreses) => setState() => _addresses = addresses)
```

now in child widget we need to use it and in order to do that we first need to define a type of a callback
```dart
typedef AddressesCallback = void Function(List<Strings> addresses);
```

and now you can use it in a child widget as a parameter

```dart
class MyChildWidget extends StatefulWidget {
  AddressesCallback callback;
  MyChildWidget({super.key required this.callback});
}
// ... in state for example on press
callback(apiResponse);
```
