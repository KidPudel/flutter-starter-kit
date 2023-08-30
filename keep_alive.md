If you want to keep widget alive and not reload every time, use `AutomatiallyKeepAliveClientMixin`

```dart
class _MenuPageState extends State<MenuPage> with AutomaticKeepAliveClientMixin<MenuPage> {
```
and override
```dart
@override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
```
