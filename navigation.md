# Navigation Rail
The **navigation rail** has destinations, with their respective icons and labels. It also defines the current `selectedIndex`.   
A _selected index of zero selects the first destination_, a _selected index of one selects the second destination_, and so on. For now, it's hard coded to zero.
The **navigation rail** also _defines what happens when the user selects one of the destinations_ with `onDestinationSelected`.  


```dart
SafeArea(
    child: NavigationRail(
      extended: false,
      destinations: [
        NavigationRailDestination(
          icon: Icon(Icons.home),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.favorite),
          label: Text('Favorites'),
        ),
      ],
      selectedIndex: 0,
      onDestinationSelected: (value) {
        print('selected: $value');
      },
    ),
  ),
```

# Navigation 
More about navigation [here](https://docs.flutter.dev/development/ui/navigation)

The `Navigator` widget displays screens as a stack using the correct transition animations for the target platform. To navigate to a new screen, access the `Navigator` through the route’s `BuildContext` and call imperative methods such as `push()` or `pop()`:

```dart
onPressed: () {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const SongScreen(song: song),
    ),
  );
},
child: Text(song.name),
```

Because `Navigator` keeps a stack of `Route` objects (representing the history stack), The `push()` method also takes a `Route` object. The `MaterialPageRoute` object is a subclass of `Route` that specifies the transition animations for Material Design.

# Structured way
Navigating to another page in Flutter involves using the `Navigator` class. Here are some best practices and common patterns for navigating between screens:

1. **Use Named Routes**: Define named routes for your app's screens. This provides a clear and maintainable way to navigate between different parts of your app. Define your routes using `MaterialApp`'s `routes` parameter or `CupertinoApp`'s `onGenerateRoute` parameter.

2. **Push Named Routes**: To navigate to another page, use `Navigator.pushNamed(context, '/routeName')`. This approach makes your code more readable and understandable.

3. **Pass Data Using Arguments**: When navigating, you can pass data to the next screen using the `arguments` parameter. For example:

```dart
Navigator.pushNamed(context, '/details', arguments: {'id': 123});
```

In the receiving screen, you can access the arguments using `ModalRoute.of(context).settings.arguments`.

4. **Handle Pop and Result**: If you need to handle actions when navigating back from a screen, use `Navigator.pop(context, result)`. The returned result can be received using `await Navigator.push(context, MaterialPageRoute(...))`.

5. **Use MaterialPageRoute**: For simple navigation, you can use `MaterialPageRoute` directly. It automatically applies platform-specific transition animations.

6. **Use Push Replacement**: If you want to replace the current screen with a new one, use `Navigator.pushReplacement(context, MaterialPageRoute(...))`.

7. **Handle Back Button**: Handle the back button behavior using `WillPopScope`. You can prevent navigating back if needed.

8. **Avoid Deep Nesting**: Minimize deep nesting of navigators. Nesting multiple `Navigator` widgets can lead to complications and unexpected behavior.

9. **Navigation Service**: For more complex apps, consider creating a navigation service to encapsulate navigation logic. This can make navigation code cleaner and more testable.

10. **Use MaterialPageRoute.builder**: If you need to perform additional logic before pushing a screen, you can use `MaterialPageRoute.builder` to provide a builder function.

11. **Use Navigation Guards**: Implement navigation guards using `RouteAware` and `RouteObserver` to perform actions when screens are pushed and popped.

Here's an example of how to set up named routes:

```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/details': (context) => DetailsScreen(),
      },
    );
  }
}
```

Then, you can navigate between screens using:

```dart
Navigator.pushNamed(context, '/details', arguments: {'id': 123});
```

# GestureDetector
maybe you need to make some part of your app clickable, well here is [GestureDetector](https://docs.flutter.dev/cookbook/gestures/handling-taps)

```dart
  return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                name: characters.data
                                        ?.elementAt(index)
                                        .fullName ??
                                    "error",
                              ),
                            ),
                          );
                        },
                        child: Card(
                          child: Container(
                            decoration: boxDecoration(
                            .............................
```

# go_route
url based deep link handling package for navigating
```dart
GoRouter _route = GoRouter(
    routes: [
        GoRoute(
            path: '/map_screen',
            builder: (context, state) => const MapScreen()
        ),
        GoRoute(
            path: '/menu_screen/:address',
            builder: (context, state) => MenuScreen(state.pathParameters['address'] ?? 'routing_error')
        ),
    ]
)
```
to navigate
```dart
GoRouter.of(context).go(Screens.MapScreen().route)
```
or use handy extension methods
```dart
context.go(Screens.MapScreen().route)
```

## To navigate just a subsection of the screen and static part just leave (like bottom bar navigation)
Wrap routes in `ShellRoute`
```dart
routes [
    ShellRoute(
        routes[
            ...
        ]
        builder: (context, state, child) => MyBottomBarNavigation(child)
    )
]
```
