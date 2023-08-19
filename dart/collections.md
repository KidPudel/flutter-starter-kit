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
## spread operator

```dart
final addedList = [oldList...5];
// 1, 2, 3, 4, 5
```
