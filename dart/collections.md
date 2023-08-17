# Operations on Lists
You can create a new list with already putted item like that
```dart
detecting type
final updatedDishes = List.of(state.dishes)..add(BasketDish(dish: event.dishToAdd));
// not detecting type
final updatedDishes = List.from(state.dishes)..add(BasketDish(dish: event.dishToAdd));
```
## spread operator

```dart
final addedList = [oldList...5];
// 1, 2, 3, 4, 5
```
