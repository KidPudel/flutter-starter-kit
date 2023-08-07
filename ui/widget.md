# What is the equivalent of a View in Flutter?
In Android, the `View` is the foundation of everything that shows up on the screen. Buttons, toolbars, and inputs, everything is a View. In Flutter, the rough equivalent to a `View` is a `Widget`.  
`Widgets` don’t map exactly to Android views, but while you’re getting acquainted with how Flutter works you can think of them as “the way you declare and construct UI”.  

Every widget defines a `build()` method that's **automatically called every time the widget's circumstances change so that the widget is always up to date.**

`build` is the method that basically builds this widget.  
Describes the part of the UI represented by this widget.  
framework calls this method in a number of different situations. For example:
- After calling initState.
- After calling didUpdateWidget.
- After receiving a call to setState.
- After a dependency of this State object changes (e.g., an InheritedWidget referenced by the previous build changes).
- After calling deactivate and then reinserting the State object into the tree at another location.

`BuildContext` think of a BuildContext as _the part of Widgets tree_ **_where the Widget is attached to this tree_**

# Lifespan
However, these have a few differences to a View. To start, widgets have a different lifespan: they are _immutable and only exist **until they need to be changed**_.   
Whenever widgets or their state change, Flutter’s framework creates a new tree of widget instances.   
In comparison, an Android view is drawn once and does not redraw until invalidate is called.


# How do I update widgets?
In Android, you update your `views` by directly mutating them.   
However, in Flutter, `Widgets` are **immutable** and are **not updated directly**, instead you have to work with the **widget’s state**.  
There are two types of `Widgets`:  
- `Statefull` — a widget that has a **State** object that stores state data across frames and restores it.
- `Stateless` — a widget with no state information.

---

> `StatelessWidgets` are useful when the part of the user interface you are describing does not depend on anything other than the configuration information in the object.
For example, in Android, this is similar to placing an `ImageView` with your logo. The logo is not going to change during runtime, so use a StatelessWidget in Flutter.


> If you want to dynamically change the UI based on data received after making an HTTP call or user interaction then you have to work with `StatefulWidget` and tell the Flutter framework that the widget’s State has been updated so it can update that widget.


> The important thing to note here is at the core both `stateless` and `stateful` widgets behave the same. They rebuild every frame, the difference is the StatefulWidget has a State object that stores state data across frames and restores it.

**_if a widget changes (because of user interactions, for example) it’s stateful. However, if a widget reacts to change, the containing parent widget can still be stateless if it doesn’t itself react to change._**

## Example

Until now, `MyAppState` covered all your state needs. That's why all the widgets you have written so far are stateless. They don't contain any mutable state of their own. None of the widgets can change itself—they must go through MyAppState.

---

The following example shows how to use a StatelessWidget. A common StatelessWidget is the Text widget. If you look at the implementation of the Text widget you’ll find that it subclasses StatelessWidget.

```dart
Text(
  'I like Flutter!',
  style: TextStyle(fontWeight: FontWeight.bold),
);
```
As you can see, the Text Widget has no state information associated with it, it renders what is passed in its constructors and nothing more.

But, what if you want to make “I Like Flutter” change dynamically, for example when clicking a FloatingActionButton?

To achieve this, wrap the Text widget in a StatefulWidget and update it when the user clicks the button.

For example:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const SampleApp());
}

class SampleApp extends StatelessWidget {
  const SampleApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SampleAppPage(),
    );
  }
}

// This class is the configuration for the state. It holds the values
// provided by the parent and used by the build method of the State.
class SampleAppPage extends StatefulWidget {
  const SampleAppPage({super.key});

  @override
  State<SampleAppPage> createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  // Default placeholder text.
  String textToShow = 'I Like Flutter';

  void _updateText() {
    setState(() {
      // Update the text.
      textToShow = 'Flutter is Awesome!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample App'),
      ),
      body: Center(child: Text(textToShow)),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateText,
        tooltip: 'Update Text',
        child: const Icon(Icons.update),
      ),
    );
  }
}
```

# Inherited Widget
Inherited widgets lets you access state from way above in the widget tree

![image](https://user-images.githubusercontent.com/63263301/219377591-e13dae2d-42b6-4a3e-8461-daf5f363df64.png)

For example, you can use it to store constants across your program.  
1. is to create Inherited widget, to wrap your whole app with
   ```dart
   class Constants extends InheritedWidget {
     final String url = "http:/192.168.1.8:8080";
     final Color spanishLavender = const Color.fromARGB(255, 73, 43, 131);
     final Color selectiveYellow = const Color.fromARGB(255, 249, 182, 26);
     final Color bakerMilkPink = const Color.fromARGB(255, 255, 153, 187);
     final Color lightCyan = const Color.fromARGB(255, 215, 255, 255);
   
     const Constants({required Widget child, super.key}) : super(child: child);
   
     static Constants? of(BuildContext context) =>
         context.dependOnInheritedWidgetOfExactType<Constants>();
   
     @override
     bool updateShouldNotify(InheritedWidget oldWidget) => true;
   }
   ```
2. is to wrap
   ```dart
   void main() {
     runApp(
       Constants(
         child: Application(),
       ),
     );
   }
   ```
3. is use our constants
   ```dart
     @override
     Widget build(BuildContext context) {
       var constants = Constants.of(context);
       return MaterialApp(
         theme: ThemeData().copyWith(
           colorScheme: ThemeData()
               .colorScheme
               .copyWith(primary: constants?.spanishLavender, secondary: constants?.selectiveYellow),
         ),
         home: Home(),
       );
     }
   }
   ```

# Helpful widgets
- `Scaffold` fundamental building block that provides some convenients, but you can go without it, like use `CustomScrollView`
- `SafeArea` it pads a child to match a space area
- `Column` - when you want a simple vertical layout without scrolling.
- `Row`
- `Stack`
- `ListView` scrollable, when you have a large list of items that need to be scrollable
  - `.builder` and created on demand (lazy)
- `ScrollView` is used to put different or same child views or layouts and the all can be scrolled. Use `ScrollView` when you need more control over the scrolling behavior or want to create custom scrolling effects.
- `FutureBuilder`
- `Container`
- `Card`
- `BoxDecoration`
- `GestureDetector`
- `Padding`
- `SizedBox` - to set exact size (like height and width)
- `Button`
- `Explanded` - to make a child widget take up the remaining available space along the main axis. **if you want to make something fill max size, use expanded** also you can use flex in case of a competition
- `Flexible` - to scale the child widget accordingly like weight(0.5f) 
- `ClipRRect` - to round an image
