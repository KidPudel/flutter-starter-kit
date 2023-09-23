# Operations on Lists
You can create a new list with already putted item like that
```dart
detecting type
final updatedDishes = List.of(state.dishes)..add(BasketDish(dish: event.dishToAdd));
// not detecting type
final updatedDishes = List.from(state.dishes)..add(BasketDish(dish: event.dishToAdd));
```

- `expand` Expands each element of this Iterable into zero or more elements.
  ```dart
  var pairs = [[1, 2], [3, 4]];
  var flattened = pairs.expand((pair) => pair).toList();
  print(flattened); // => [1, 2, 3, 4];

  var input = [1, 2, 3];
  var duplicated = input.expand((i) => [i, i]).toList();
  print(duplicated); // => [1, 1, 2, 2, 3, 3]
  ```
  or just like that
  ```dart
  var list1d = [for (var list in list2d) ...list];
  ```
- `any` - checks if any of the element satisfy the predictor
- `contains`
- `where` - filter
- `map`
- `first`
- `firstWhere`
- `getRange`
- `entry`
- `substring`
- `replaceAll`
- `expland` - make a 1d collection (concatenate)
## spread operator

```dart
final addedList = [oldList...5];
// 1, 2, 3, 4, 5
```
