### Column

Jetpack Compose:
```kotlin
Column(
    modifier = Modifier.fillMaxWidth(),
    verticalArrangement = Arrangement.Center
) {
    Text("Item 1")
    Text("Item 2")
}
```

Flutter:
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text('Item 1'),
    Text('Item 2'),
  ],
);
```

### Row

Jetpack Compose:
```kotlin
Row(
    modifier = Modifier.fillMaxWidth(),
    horizontalArrangement = Arrangement.Center
) {
    Text("Item 1")
    Text("Item 2")
}
```

Flutter:
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text('Item 1'),
    Text('Item 2'),
  ],
);
```

### Box

Jetpack Compose:
```kotlin
Box(
    modifier = Modifier
        .size(100.dp)
        .background(Color.Red)
) {
    Text("Box Content")
}
```

Flutter:
```dart
Container(
  width: 100,
  height: 100,
  color: Colors.red,
  child: Text("Box Content"),
);
```

### Text

Jetpack Compose:
```kotlin
Text(
    "Hello, world!",
    color = Color.Black,
    fontSize = 20.sp
)
```

Flutter:
```dart
Text(
  'Hello, world!',
  style: TextStyle(
    color: Colors.black,
    fontSize: 20,
  ),
);
```

### TextField

Jetpack Compose:
```kotlin
var textValue by remember { mutableStateOf("") }

TextField(
    value = textValue,
    onValueChange = { textValue = it },
    label = { Text("Enter text") }
)
```

Flutter:
```dart
String textValue = '';

TextField(
  onChanged: (value) => setState(() { textValue = value; }),
  decoration: InputDecoration(
    labelText: 'Enter text',
  ),
);
```

### Card

Jetpack Compose:
```kotlin
Card(
    modifier = Modifier.fillMaxWidth(),
    elevation = 8.dp,
) {
    Column(
        modifier = Modifier.padding(16.dp)
    ) {
        Text("Card Title")
        Text("Card Content")
    }
}
```

Flutter:
```dart
Card(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text('Card Title'),
      Text('Card Content'),
    ],
  ),
);
```

### Image

Jetpack Compose:
```kotlin
Image(
    painter = painterResource(R.drawable.my_image),
    contentDescription = "My Image",
    modifier = Modifier.size(100.dp)
)
```

Flutter:
```dart
Image.asset(
  'assets/my_image.png',
  width: 100,
  height: 100,
  fit: BoxFit.cover,
);
```

### Scaffold

Jetpack Compose:
```kotlin
Scaffold(
    topBar = {
        TopAppBar(
            title = { Text("My App") }
        )
    },
    content = {
        Text("App Content")
    }
)
```

Flutter:
```dart
Scaffold(
  appBar: AppBar(
    title: Text('My App'),
  ),
  body: Text('App Content'),
);
```

### Spacer

Jetpack Compose:
```kotlin
Column {
    Text("Item 1")
    Spacer(modifier = Modifier.height(8.dp))
    Text("Item 2")
}
```

Flutter
Flutter:
```dart
Column(
  children: <Widget>[
    Text('Item 1'),
    SizedBox(height: 8),
    Text('Item 2'),
  ],
);
```

-----------

# Modifier's equivalents

Sure, here are the Flutter equivalents to the Jetpack Compose modifiers you listed:

- `background`: In Flutter, you can set the background color of a widget using the `Container` widget and setting its `color` property. For example:
```dart
Container(
  color: Colors.blue,
  child: Text("Hello"),
)
```

- `fillMaxSize`: In Flutter, you can achieve the same effect as `fillMaxSize` by wrapping the widget in a `Expanded` widget. For example:
```dart
Expanded(
  child: Text("Hello"),
)
```

- `weight`: In Flutter, you can use the `Flexible` widget to distribute the available space among widgets. The `Flexible` widget takes a `flex` property that determines how much of the available space to allocate to each widget. For example:
```dart
Row(
  children: [
    Flexible(
      flex: 1,
      child: Text("Item 1"),
    ),
    Flexible(
      flex: 2,
      child: Text("Item 2"),
    ),
  ],
)
```

- `heightIn`: In Flutter, you can set the height of a widget using the `SizedBox` widget. The `SizedBox` widget takes a `height` property to specify the height of the widget. For example:
```dart
SizedBox(
  height: 100,
  child: Text("Hello"),
)
```

- `size`: In Flutter, you can set the size of a widget using the `SizedBox` widget. The `SizedBox` widget takes both `width` and `height` properties to specify the size of the widget. For example:
```dart
SizedBox(
  width: 200,
  height: 100,
  child: Text("Hello"),
)
```

- `offset`: In Flutter, you can position a widget using the `Positioned` widget. The `Positioned` widget takes `left`, `right`, `top`, and `bottom` properties to specify the position of the widget relative to its parent. For example:
```dart
Stack(
  children: [
    Positioned(
      left: 20,
      top: 20,
      child: Text("Hello"),
    ),
  ],
)
```

- `border`: In Flutter, you can set the border of a widget using the `Container` widget and setting its `decoration` property. For example:
```dart
Container(
  decoration: BoxDecoration(
    border: Border.all(
      color: Colors.black,
      width: 1,
    ),
  ),
  child: Text("Hello"),
)
```

- `clickable`: In Flutter, you can make a widget clickable by wrapping it in a `GestureDetector` widget and providing a `onTap` callback. For example:
```dart
GestureDetector(
  onTap: () {
    print("Clicked");
  },
  child: Text("Hello"),
)
```

- `scrollable`: In Flutter, you can make a widget scrollable by wrapping it in a `ListView` or `SingleChildScrollView` widget. For example:
```dart
ListView(
  children: [
    Text("Item 1"),
    Text("Item 2"),
    Text("Item 3"),
  ],
)
```

- `draggable`: In Flutter, you can make a widget draggable by wrapping it in a `Draggable` widget. The `Draggable` widget takes a `child` and a `feedback` parameter to specify the visual representation of the widget while it's being dragged. For example:
```dart
Draggable(
  child: Text("Drag me"),
  feedback: Text("Dragging..."),
  childWhenDragging: Op
