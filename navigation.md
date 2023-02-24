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
More about navigation [here](https://docs.flutter.dev/development/ui/navigation)
