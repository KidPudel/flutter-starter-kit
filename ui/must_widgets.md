https://guillaume.bernos.dev/10-beginners-mistakes-to-learn-from-in-flutter/

# Must-have widgets
- `Scaffold` fundamental building block that makes everything more convenient, like provides background color, sets some defaults, provides some implementions etc, but you can go without it, like use `CustomScrollView`  
  When might you choose not to use `Scaffold`?

  1. **Custom Layouts:** If your app's design doesn't follow the Material Design guidelines or requires a unique layout structure, you might choose to create a custom layout using other widgets.

  2. **Non-Material Design:** If you are building an app with a different design language (e.g., Cupertino-style for iOS apps), you may prefer to create your custom layout without the Material-specific components provided by `Scaffold`.

  3. **Minimalistic Apps:** For small, single-screen apps or apps with very minimal UI, you may not need the full structure provided by `Scaffold`, and you can directly use widgets like `Container` or `Column` to create the UI.

  4. **Custom Scroll Behaviors:** If you need advanced custom scroll effects or complex scrollable layouts that go beyond the standard app bar and scrolling behavior provided by `Scaffold`, you may prefer to use `CustomScrollView` with slivers directly.
  Flutter offers great flexibility, allowing you to build UIs using a wide variety of widgets and patterns, giving you the freedom to choose the most suitable approach for your app's needs.

# Alignment (vertical, horizontal etc)
- `SafeArea` it pads a child to match a space area
- `Column` - when you want a simple vertical layout without scrolling.
- `Row`
- `Stack` - place on top
- `Wrap` - you may have too many elements and it would just go to another line
- `ListView` **scrollable**, when you have a large list of items that need to be scrollable
  - `.builder` and created on demand (lazy)
  - `shrinkWrap: true` - to limit height
  - `primary: false` - to disable scrolling, which could make it a part of one scrollable object like `SliverList` 
- `ScrollView` is used to put different or same child views or layouts and the all can be scrolled. Use `ScrollView` when you need more control over the scrolling behavior or want to create custom scrolling effects.
- `slivers` -  A sliver is a portion of a scrollable area that you can define to behave in a special way. You can use slivers to achieve custom scrolling effects, such as elastic scrolling.
  - explaned https://www.youtube.com/watch?v=Mz3kHQxBjGg&ab_channel=GoogleforDevelopers
- `CustomScrollView` -  when you need to create custom scroll effects or complex scrollable layouts using multiple slivers, and you want more control over the scroll behavior and UI appearance.
- SliverList
- GridView.builder
- `SingleChildScrollableView` - connects wisget to one scrollable view (disables all nested scrolling)
  ![image](https://github.com/KidPudel/flutter-starter-kit/assets/63263301/02cf4209-29ed-4d89-8161-0e65b8cceeb8)
  ![image](https://github.com/KidPudel/flutter-starter-kit/assets/63263301/b8e9a660-d08d-40e1-8480-a1626efbba33)
- `ScrollablePositionedList`
- `Padding`
  - `SliverPadding`
- `SizedBox` - to set exact size (like height and width) aslo you can use `Continer` for that
- `Expanded` - **responsive ui** to make a child widget take up the remaining available space along the main axis. **if you want to make something fill max size, use expanded** also you can use flex in case of a competition
- `Flexible` - **responsive ui** to scale the child widget accordingly like weight(0.5f) _**IN `COLUMN` OR `ROW`**_, or rather scales as it needs, if nested `ListView` is `Flexible` in column, meaning in could overflow (unbounded error of column) `Flexible` will make `ListView` scale and take all available skill (**_if needs_** , as opposite to `Expanded`, which takes all space available everytime, even if it doesn't need to)
  - fit `loose` - container take preferable size
  - fit `tight` - to force it take a space
- `FractionallySizedBox` - takes some % of all awailable space (if it alone, then it always take max), also can be used like a spacer but fractional kind of like `Spacer(modifier = Modifier.weight(0.1f)`, and to play well with Rows and Columns, wrap with `Flexible` 
- `FittedBox` - to fit a space of a parent
  - `BoxFit.contain`, `fitWidth`, `fill`, `none`
  - `alignment`
- `PreferredSize` - advertises the preferred size which can be used by parent
- `LayoutBulder` - can give you currect available space size, as well you can handle logic if too small for example, because of flexible, and you cant see an image, just return image without flexible otherwize
- `MediaQuery` - **responsive ui**, establishes a subtree in which media query resolves to the given data (like to learn the size of the current media), you can find the width and the height of any device
- `BoxConstrains` - **responsive ui**
- `Positioned`

## You can space elements with
- `SizedBox`
- `Flexible` - in columns and rows
- `Padding` - in columns and rows

## You can size elements with
- `LayoutBulder` - can give you currect available space size so you can size your object accordingly, as well you can handle logic if too small for example, because of flexible, and you cant see an image, just return image without flexible otherwize
- `PreferredSize` - advertises the preferred size which can be used by parent
- `MediaQuery` - **responsive ui**, establishes a subtree in which media query resolves to the given data (like to learn the size of the current media), you can find the width and the height of any device
- `FractionallySizedBox` - in columns and rows (dont forget to use flexible)
- `FittedBox` - to fit a space of a parent by some rules
  - `BoxFit.contain`, `fitWidth`, `fill`, `none`
  - `alignment`
- `SizedBox` - to set exact size (like height and width) aslo you can use `Continer` for that
- `FractionallySizedBox` - in columns and rows (dont forget to use flexible)
- `SizedBox` - to set exact size (like height and width) aslo you can use `Continer` for that
- `Expanded` - **responsive ui** to make a child widget take up the remaining available space along the main axis. **if you want to make something fill max size, use expanded** also you can use flex in case of a competition
- `Flexible` - **responsive ui** to scale the child widget accordingly like weight(0.5f) _**IN `COLUMN` OR `ROW`**_, or rather scales as it needs, if nested `ListView` is `Flexible` in column, meaning in could overflow (unbounded error of column) `Flexible` will make `ListView` scale and take all available skill (**_if needs_** , as opposite to `Expanded`, which takes all space available everytime, even if it doesn't need to)
  - fit `loose` - container take preferable size
  - fit `tight` - to force it take a space
- `FractionallySizedBox`

# Other
- `AppBar`
- `SliverAppBar`
- `SliverToBoxAdapter` - to place a non sliver widget in sliver
- `SliverFillRemaining`
- `FlexibleAppBar`
- `AnimatedFoo`
  - `AnimatedContainer` animated container that animates its children explicitly
  - `AnimatedIcon`
    ![image](https://github.com/KidPudel/flutter-starter-kit/assets/63263301/b5dfcb20-93ff-4d32-b883-4d51bb87810d)

- `FooTransition`
- `FutureBuilder` - we can know when it is loading and display `CircularProgressIdicator`
- `CircularProgressIndicator`
- `Container` - do you need a background color, or shape or some size constraints (position also) aslo padding and margin
- `Card` - like a Container but with elevation
- `BoxDecoration` - to set decration in container
- `GestureDetector`
  - onTap
  - onPan (swipe)
  - etc

- Buttons
  - `ElevatedButton`
  - `OutlinedButton`
  - `TextButton`
  - `IconButton`
  - `ToggleButton`

- `ClipRRect` - to round a widget (but with `Container` it is preferable to use `decoration:` istead)

- `Visibility`
- `Divider`
- `Text`
  - `overflow`
- `RichText`
- `IntroductionScreen`
- `CircleAvatar`
- `SplashScreen` - to show loading or smth
- `SnackBar`
- `GoogleFonts` - `google_fonts: ^version`
- `SelectibleText`
- [`Hero`](https://www.youtube.com/watch?v=Be9UH1kXFDw&ab_channel=GoogleforDevelopers) - allows the user to focus while navigating, nice animation
  
- `LauncherIcon`
- `Navigator`
- `ButtonSheet` - SHEET !!! also you can use `showButtonSheet()` and `showModalButtonSheet()`
- `Image`, `AssetImage`
  - `fit` - to scale, like fit height, or fill (it can be used instead of FittedBox and LayoutBilder)
  - `height`, `width`
- `CachedNetworkImage`
- `Color`/`Colors`
- `LinearGradient`
- `BackdropFilter` - to apply some filters like to the container
- `showDatePicker`
- `AnimatedSwitcher` - its main job is to automatically create a cross-fade transition when its child widget changes.
- `ChangeNotifier` - provides change notification to its lisnteners

# Packages
- Geocoding - [`Geocoding`](https://pub.dev/packages/geocoding), [`Geocoder`](https://pub.dev/packages/geocoder), [`yandex_geocoder`](https://pub.dev/packages/yandex_geocoder) 
- [`FlutterMap`](https://docs.fleaflet.dev/)
- [`scrollable_positioned_list`](https://pub.dev/packages/scrollable_positioned_list)
- [`flutter_bloc`](https://pub.dev/packages/flutter_bloc)
- [`scrollable_positioned_list`](https://pub.dev/packages/flutter_platform_widgets)
- [`go_route`](https://pub.dev/packages/go_router)
- [`permission_handler`](https://pub.dev/packages/permission_handler)

---

So when you usr some fixed not scrollabe layout like column, use flexible and expanded and stuff, for scrollable you can set sizes, because it is scrollable.  
to make list scrollable inside fixed size column, just make it shrink-warp abd flexible or expanded, so it could take rest of space available and still scrollable by itself but just not full screen, but size youve given, and if you want to make nested list a part of other list, just make it not scrollable primary false, or if it inside column then make SingleSctollqbleView
# Tips
- Don't forget to wrap your list with `Expanded` or `SizedBox` to avoid unbounded error
- `BoxClip.cover` - as small as possible while still covering entiring target box
- USE `ScrollController` it is supper dope!!! `.animateTo` :3
- Spread operator, you could have a another list of items in columns, and you can go with `children: [Button(), ...anotherButtons]`
- To check the platform just use `Platform.isAndroid` or [this](https://github.com/KidPudel/flutter-starter-kit/blob/main/platform_specific.md)
- `Lint` plugin to show you all best practices
- Use `Flexible` fit (tight to really take up space)

## working with lists (column, row, listview, grid.. etc..)
- if you want to put another list into a `listview`, just use column, because columns are not scrollable and then use another nested list if you want and to disable scrolling, set scrolling false or use not scrollable physics
- another way to make whole widget single scrollable is to wrap it with `SingleChildScrollableView` (and dont forget to disable scrolling on nested views), but also itead of `SingleChildScrollableView` and `column` you can use `list view`, which make it scrollable, but make children not scrollable
- if you want to use some nested listview in column, you want yo use shrinkWrap = true, to make it not infinite height, and use Flexible to take it as much space as
it needs and it will become scrillable

---

So meaning, `flexible` digit will make nest at least you inside of `column` take all available space as he needs as opposite to `expanded`, which will always take available space on the screen, even if it doesn’t need to

`Column` is not scrollable so it could “overflow”, but it’s actually error of unbounded. so for example inside of `column` for nested widget you could `Expanded` it with or `flexible` to take all available space it needs space it’s good or less and alternatively, wrap it with `Expanded` it to take all available space on the screen or `sizebox` too take specified size which could overflow but you actually manage it

---

# Example of using layouts like columns (columns use flexible) and builders as well as nesting and combining all to one scrollable

```dart
@override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: CustomScrollView(
            controller: _controller,
            slivers: [
              superSliverAppBar(),
              sliverCategoriesAppBar(),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) {
                    return CategoryMenuListItemScreen(
                        categoryMenuListItem: constants.menu[i]);
                  },
                  childCount: constants.menu.length,
                ),
              )
            ],
          ),
        ));
  }
```


```dart
@override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true, // limit height
      primary: false, // disable scrolling
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.categoryMenuListItem.category,
                  style: const TextStyle(fontSize: 30),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
        firstItem(widget.categoryMenuListItem.firstItem),
        GridView.builder(
          shrinkWrap: true, // limit height
          primary: false, // disable scrolling
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: widget.categoryMenuListItem.restOfItems.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            return dishCard(widget.categoryMenuListItem.restOfItems[i]);
          },
        )
      ],
    );
  }
```


# Great example of using Column and Flexible space with FractionallySizedBox

```dart
@override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Image.asset("images/brand_images/big_logo.png", fit: BoxFit.fill,),
                ),
                Flexible(
                  flex: 5,
                  fit: FlexFit.tight,
                  child: AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    transitionBuilder: (child, animation) => FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                    child: Image.asset(
                      listOfDishes[currentImage],
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitHeight,
                      key: ValueKey(currentImage),
                    ),
                  ),
                ),
                Flexible(
                    child: FractionallySizedBox(
                  heightFactor: 0.1,
                )),
                Flexible(
                  child: FractionallySizedBox(
                    widthFactor: 0.8,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/map_screen');
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: CustomColors().buttonColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Text("Choose an address",
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                  ),
                ),
                Flexible(
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Sign in",
                        style: TextStyle(color: Colors.black),
                      )),
                )
              ],
            ),
            Align(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(flex: 1, child: Container()),
                    Flexible(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomColors().buttonColor),
                        height: 110,
                        width: 110,
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "delivery",
                                style: TextStyle(fontSize: 14),
                              ),
                              Text(
                                "30",
                                style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.w900,
                                    height: 0.9),
                              ),
                              Text("minutes",
                                  style: TextStyle(fontSize: 14, height: 0.5)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container())
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

```

# How wrapping a Column > Expanded with another Expanded solves the error.

RenderFlex Unbounded Error
A common nested Column-Expanded hierarchy that gets the "RenderFlex children have non-zero flex but incoming height constraints are unbounded" error:
```
Screen
  → Column
    → Column
      → Expanded → ERROR
```
What's happening:
```
Screen
  ↓ constraint ↓ (Screen)
  Column
    Text_A (fixed height: no constraint needed) → OK
    Column 
      ↓ constraint ↓ (unbounded)
      Text_B (fixed height) → OK
      Expanded: calc. height = unbounded - Text_B → ERROR
```
During layout, a Column performs (in order):

fixed-height (i.e. null/zero flex-factor) widget layouts in unbounded space, then...
flex-factor sized widgets, calculating remaining space from the parent (i.e. incoming constraints) & the fixed size widgets
Text_A above is fixed-height. It doesn't use incoming constraints for layout.

Expanded though, is a flex-factor widget, sizing itself on remaining space, after fixed-size items are laid out. This requires an incoming constraint (parent size) to do subtraction:

  parent size (constraint) - fixed-items size = remaining space
The 1st Column gets constraints from the device screen (provided via Scaffold, etc.).

But, the 2nd Column (the nested one) is laid out in unbounded space.

Remaining space cannot be calculated:
  unbounded - Text_B = unbounded (error)
Why is a Nested Column Unbounded?
```

Screen
  → Column
    → Column
      → Expanded
```
Copied from Column SDK source documentation, Step 1:

/// 1. Layout each child with a null or zero flex factor (e.g., those that are not
///    [Expanded]) with unbounded vertical constraints
The 2nd, nested Column:

is a child of Column (the 1st one, obviously), and...
has zero or null flex factor
The second point is easy to miss/not see, but Column is not a flex-factor widget.

Checking SDK source...

Column extends Flex class.

Flex, does not have a flex field / flex factor. Only Flexible class and its children are flex factor widgets.

So the 2nd Column is laid out in unbounded constraints because it is not a flex-factor widget. Those unbounded constraints are used to layout Text_B widget (a fixed-size or null flex factor widget), then Expanded tries to calculate remaining space. When trying to calculate remaining space with an unbounded constraint....

  unbounded - Text_B = unbounded (error)
🔥 Expanded explodes 🔥

Flexible
To be hyper-repetitive: Flexible, is the flex-factor widget with a flex field/factor.

Expanded and Spacer are the only child classes of Flexible (that I know of).

So Expanded, Spacer, and Flexible are the only flex-factor widgets and

Flexible != Flex

The Fix - Adding Bounds
Fixing the widget tree:
```
Screen
  → Column
    → Expanded ← new
      → Column
        → Expanded → OK
```
Why this works...
```
Screen
  ↓ constraint ↓
  Column
    Text_A ↑ fixed-size ↑
    ↓ constraint ↓ (calculated: Screen height - Text_A height)
    Expanded_A
      ↓ constraint ↓ (Screen - Text_A)
      Column
        Text_B ↑ fixed-size ↑
        Expanded_B: calc. height = (Screen - Text_A) - Text_B = remaining space → OK
```
In this case... After fixed-items are laid out (Text_A), remaining space is calculated for Expanded_A:

parent size (screen) - fixed-items (Text_A) = remaining space
Now Expanded_A has a defined amount of space.

Expanded_A provides its size for use by the child Column calculating remaining space for Expanded_B after laying out Text_B.

parent size - fixed-items = remaining space
                  ↓
(Screen - Text_A) - (Text_B) = remaining space for Expanded_B
Now all flex-factor relative sized widgets (i.e. Expanded_A, Expanded_B) have bounded constraints with which to calculate their layout size.

Note that you can use Flexible interchangably here with Expanded. It calculates remaining space the same way as Expanded. It just doesn't force children to fit its size, so they can be smaller if they wish.

```
NOT OK
/// Unbounded constraint: NOT OK
class RenderFlexUnboundedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Text('Column > Column > Text_A'),
              Expanded(
                  child: Text('Column > Column > Expanded_A')) // explosions
            ],
          )
        ],
      ),
    );
  }
}
OK
/// Constraints provided: OK
class RenderFlexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Column > Text_A'),
          Expanded( // Expanded_A
            child: Column(
              children: [
                Text('Column > Expanded_A > Column > Text_B'),
                Expanded( // Expanded_B
                    child: Text('Column > Expanded_A > Column > Expanded_B'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
```
