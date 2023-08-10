# There is two types of animations
1. Code-based animations that is ther to enhance/mutate the look and feel of for example base widgets like row or column like changing colors shapes and positions
   ![image](https://github.com/KidPudel/flutter-starter-kit/assets/63263301/e0ea01a3-36b7-4750-9013-e145075e8404)  
2. Drawn-based animations looks like someone has drawn them, it could be srite or transformation that is hart to do with code

# Code-based animations
They could be:
- Implicit, rely on simnply setting a new value for some widget property
- Explicit, explicit animations involve `AnimationController` and animated only when explicitly asked  
How to choose?
- Does it repeat "forever"? (as long as it on screen or as long as condition is true)
- Is it discontinous? (animation with a circle from small, to large, but not back, it just starts again, small large - small, large)
- Do multiple widgets animated together?
If any of those are yes, then your explicit widget

### Is there build-in widget?
Imlicit, look for <Animated-"foo"<- where foo is ther property you are animating> like `AnimatedContainer`
If there is no implicit build-in animation, use `TweenAnimationBuilder` to create an implicit custom animation


Explicit, look for <"foo"-Transition>  
If there is no explicit build-in animation, ask, do i want stand alone customn animation, then use `AnimationWidget`, if you want it to be a part of existing surrounding widget usew `AnimationBuilder`

# Implicit
Implicit animations in Flutter are animations that are automatically handled by the framework when a specific property of a widget changes. When the property changes, the framework automatically animates the transition from the old value to the new value.

For example, if you use a `AnimatedContainer` widget and change its `height`, `width`, `color`, or other properties using a `setState` or other state management mechanism, the framework automatically animates the transition between the old and new property values.

```dart
AnimatedContainer(
  duration: Duration(seconds: 1),
  height: _isExpanded ? 200 : 100,
  width: _isExpanded ? 200 : 100,
  color: _isExpanded ? Colors.blue : Colors.red,
),
```

# Explicit
Explicit animations, on the other hand, require more manual control over the animation process. They are used when you want to animate a property that doesn't automatically trigger animations like implicit animations.

To create an explicit animation, you typically use a `AnimationController` or `Tween` and use its value to manually update the animated property. You control when the animation starts, stops, and updates the values.

```dart
class MyAnimatedWidget extends StatefulWidget {
  @override
  _MyAnimatedWidgetState createState() => _MyAnimatedWidgetState();
}

class _MyAnimatedWidgetState extends State<MyAnimatedWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _startAnimation,
      child: Opacity(
        opacity: _animation.value,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        ),
      ),
    );
  }
}
```

In this explicit animation example, we control the opacity of the `Container` using an `AnimationController` and a `Tween`. When the user taps on the widget, `_startAnimation` is called, which triggers the animation to run.

**Choosing Between Implicit and Explicit Animations:**
- Use implicit animations when you want a simple, straightforward animation that automatically handles property changes.
- Use explicit animations when you need more control over the animation process, such as running animations based on user interactions or complex animation sequences.

Both implicit and explicit animations are powerful and can be used in combination to achieve complex and visually appealing animations in your Flutter app. It's essential to choose the right type of animation based on your specific use case and the level of control you need over the animation process.

# Build-in simple implicit animations
there are some widgets that are animated versions of existing widgets  
![image](https://github.com/KidPudel/flutter-starter-kit/assets/63263301/c8427117-6238-487a-928f-823ee0f8c13a)  
Imagine you have a simple app with `Container` and a `Button`, and when you press the button, `Image` in container changes its size  
![image](https://github.com/KidPudel/flutter-starter-kit/assets/63263301/52ff5802-686c-4418-b0d0-dca2df0627ee)  
But we can make it smooth by changing `Container` -> `AnimatedContainer`, adding duration, and as a result we get nice interpolation (the process of animating through the value between old and new)   
![image](https://github.com/KidPudel/flutter-starter-kit/assets/63263301/1833153b-9bc5-47d5-8909-d2f763227c8f)
Also you can change it's `Curve`, it changes with what rate values are changing, aslo you can add custom curves  
![image](https://github.com/KidPudel/flutter-starter-kit/assets/63263301/4da74c74-d38b-4b3e-b223-e1786f3cdeb1)  

Note that you don't have to put it in a `StatefullWidget`, you can put it in a stream or `FutureBuilder`

# Custom implicit animations
What if there is no `AnimatedFoo`??  
Don't worry, we can build it with `TweenAnimationBuilder`  
![image](https://github.com/KidPudel/flutter-starter-kit/assets/63263301/acefa9c4-c5f1-4e76-bf21-c50eb76d1190)
![image](https://github.com/KidPudel/flutter-starter-kit/assets/63263301/3f28835b-e01f-4b9f-9e2e-38a3ef5aaf29)  
Also you can animate padding values, border, eleveation etc
## overview
![image](https://github.com/KidPudel/flutter-starter-kit/assets/63263301/9b9a82d7-00c3-4cbc-982a-ea5c61433326)

# Build-in explicit animations
Explicit animations gives you more controll.  
we could do something with AnimatedContainer and Transform, but it would turn and then stop...  
![image](https://github.com/KidPudel/flutter-starter-kit/assets/63263301/2cc6bd14-2f66-4a2c-9f46-ce268aa37712)
With explicit widgets we have controll of a time, for that we need `AnimationController`  
`AnimationController` handles checking for ticks and gives us useful controlls of over what our animation doing.  
Since `AnimationController` also has its own state, we need to manage it with init and dispose
```dart
@override
void initState() {
   super.initState()
   _animationController = AnimationController(
   ...
   );
}
@override
void dispose() {
   super.dispose()
   _animationController.dispose();
}
```

For `AnimationController` we must provide two parameters:
1. `duration:` (how long is animation last) because we need an object that tells how far we are in a single rotation
2. `vsync:` gives a reference to the object to notify about changes. The presence of vsync prevents offscreen animations from consuming unnecessary resources. You can use your stateful object as the `vsync` by adding `SingleTickerProviderStateMixin` to the class definition.
