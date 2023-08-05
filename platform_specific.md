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
# Other adaptive widgets
- `Switch.adaptive()`
- `SwitchListTitle.adaptive()`
- `Slider.adaptive()`
- `CircularProgressIndicator.adapter()`
- `Icon.adaptive().share()` or `.flip_camera()` etc


# Whole adaptive app
Instead of `Scaffold` you can use `PlatformScaffold` from `flutter_platform_widgets: ^1.2.0`
and istead of MaterialApp in MyApp
```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
```

use `PlatformApp()` that has `material` and `cupertino` properties
