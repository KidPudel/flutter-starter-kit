stores the widget state when this widget moves in a widget tree, it's useful to store the widget's state having the same type of data

# ValueKey
We can trigger state of a Container with `ValueKey` to trigger smooth crossfade animation, instead of junky one
```dart
return AnimatedSwitcher(
                              duration: Duration(milliseconds: 200),
                              child: Container(
                                key: ValueKey<bool>(state.basketItems!.any(
                                    (element) =>
                                        element.basketItem.itemid ==
                                        item.itemid)),
                                child: state.basketItems!.any((element) =>
                                        element.basketItem.itemid ==
                                        item.itemid)
                                    ? _addRemoveFromBasket(context, item, state)
                                    : SizedBox(
                                        width: 150,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            final token = _pref
                                                .getString(Constants.tokenKey);
                                            final hash = _pref
                                                .getString(Constants.hashKey);
                                            if (token != null && hash != null) {
                                              context.read<OrderInfoBloc>().add(
                                                  AddToBasket(
                                                      dishToAdd: item.itemid!));
                                            } else {
                                              context
                                                  .go(Routes.loginPage().route);
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                              elevation: 5),
                                          child: Text(
                                            "${item.price} ₽",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                              ),
                            );
```
