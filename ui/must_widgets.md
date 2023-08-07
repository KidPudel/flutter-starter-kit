# Must-have widgets
- `Scaffold` fundamental building block that provides some convenients, but you can go without it, like use `CustomScrollView`  
  When might you choose not to use `Scaffold`?

  1. **Custom Layouts:** If your app's design doesn't follow the Material Design guidelines or requires a unique layout structure, you might choose to create a custom layout using other widgets.

  2. **Non-Material Design:** If you are building an app with a different design language (e.g., Cupertino-style for iOS apps), you may prefer to create your custom layout without the Material-specific components provided by `Scaffold`.

  3. **Minimalistic Apps:** For small, single-screen apps or apps with very minimal UI, you may not need the full structure provided by `Scaffold`, and you can directly use widgets like `Container` or `Column` to create the UI.

  4. **Custom Scroll Behaviors:** If you need advanced custom scroll effects or complex scrollable layouts that go beyond the standard app bar and scrolling behavior provided by `Scaffold`, you may prefer to use `CustomScrollView` with slivers directly.
  Flutter offers great flexibility, allowing you to build UIs using a wide variety of widgets and patterns, giving you the freedom to choose the most suitable approach for your app's needs.
- `SafeArea` it pads a child to match a space area
- `Column` - when you want a simple vertical layout without scrolling.
- `Row`
- `Stack`
- `ListView` scrollable, when you have a large list of items that need to be scrollable
  - `.builder` and created on demand (lazy)
- `ScrollView` is used to put different or same child views or layouts and the all can be scrolled. Use `ScrollView` when you need more control over the scrolling behavior or want to create custom scrolling effects.
- `slivers` -  A sliver is a portion of a scrollable area that you can define to behave in a special way. You can use slivers to achieve custom scrolling effects, such as elastic scrolling.
  - explaned https://www.youtube.com/watch?v=Mz3kHQxBjGg&ab_channel=GoogleforDevelopers
- `CustomScrollView` -  when you need to create custom scroll effects or complex scrollable layouts using multiple slivers, and you want more control over the scroll behavior and UI appearance.
- `AppBar`
- `SliverAppBar`
- `FlexibleAppBar`
- `AnimatedFoo`
  - `AnimatedContainer` animated container that animates its children explicitly
- `FooTransition`
- `FutureBuilder`
- `Container`
- `Card`
- `BoxDecoration`
- `GestureDetector`
- `Padding`
  - `SliverPadding`
- `SizedBox` - to set exact size (like height and width) aslo you can use `Continer` for that
- `Button`
- `Explanded` - to make a child widget take up the remaining available space along the main axis. **if you want to make something fill max size, use expanded** also you can use flex in case of a competition
- `MediaQuery` establishes a subtree in which media query resolves to the given data (like to learn the size of the current media)
- `Flexible` - to scale the child widget accordingly like weight(0.5f) 
- `ClipRRect` - to round an image

