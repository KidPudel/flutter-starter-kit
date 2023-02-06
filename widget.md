# What is the equivalent of a View in Flutter?
In Android, the `View` is the foundation of everything that shows up on the screen. Buttons, toolbars, and inputs, everything is a View. In Flutter, the rough equivalent to a `View` is a `Widget`.  
`Widgets` don’t map exactly to Android views, but while you’re getting acquainted with how Flutter works you can think of them as “the way you declare and construct UI”.  


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

> StatelessWidgets are useful when the part of the user interface you are describing does not depend on anything other than the configuration information in the object.
For example, in Android, this is similar to placing an ImageView with your logo. The logo is not going to change during runtime, so use a StatelessWidget in Flutter.
If you want to dynamically change the UI based on data received after making an HTTP call or user interaction then you have to work with StatefulWidget and tell the Flutter framework that the widget’s State has been updated so it can update that widget.
The important thing to note here is at the core both stateless and stateful widgets behave the same. They rebuild every frame, the difference is the StatefulWidget has a State object that stores state data across frames and restores it.
