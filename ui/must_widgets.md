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
- `FractionallySizedBox` - takes some % of all awailable space, also can be used like a spacer but fractional kind of like `Spacer(modifier = Modifier.weight(0.1f)`, and to play well with Rows and Columns, wrap with `Flexible` 
- `FittedBox` - to fit a space of a parent
  - `BoxFit.contain`, fitWidth, fill, none
  - alignment
- `PreferredSize` - advertises the preferred size which can be used by parent
- `LayoutBulder` - can give you currect available space size, as well you can handle logic if too small for example, because of flexible, and you cant see an image, just return image without flexible otherwize
- `MediaQuery` - **responsive ui**, establishes a subtree in which media query resolves to the given data (like to learn the size of the current media), you can find the width and the height of any device
- `BoxConstrains` - **responsive ui**
- `Positioned`

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
  - `fit` - to scale, like fit height, or fill
  - `height`, `width`
- `CachedNetworkImage`
- `Color`/`Colors`
- `LinearGradient`
- `BackdropFilter` - to apply some filters like to the container
- `showDatePicker`
- `AnimatedSwitcher` - its main job is to automatically create a cross-fade transition when its child widget changes.
- `FlutterMap`

So when you usr some fixed not scrollabe layout like column, use flexible and expanded and stuff, for scrollable you can set sizes, because it is scrollable
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
