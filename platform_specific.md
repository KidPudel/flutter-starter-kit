Imagine you write an app and you want on Android to have a native looking switch button and on IOS as well

To do so, first we need to determine on what platform we are running
```dart
final bool isIos = Theme.of(context).platform == TargetPlatform.IOS;
```

and now display based on the result

```dart
return Scaffold(
    body: Center(
        child: isIos
            ? CupertinoSwitch(
                value: isReady,
                onChanged: (newValue) {
                    setState((){
                        isReady = newValue;
                    })
                }
            )
            : Switch(
                value: isReady,
                onChanged: (newValue) {
                    setState((){
                        isReady = newValue;
                    })
                }
            ),
    )
)
```

but for some widgets like switch flutter have something better - `.adaptive`
```dart
return Scaffold(
    body: Center(
        child: Switch.adaptive(
                value: isReady,
                onChanged: (newValue) {
                    setState((){
                        isReady = newValue;
                    })
                }
            ),
    )
)
```
