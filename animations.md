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
Imlicit, look for <Animated-"foo"<- where foo is ther property you are animating> or AnimatedContainer
If there is no implicit build-in animation, use TweenAnimationBuilder to create an implicit custom animation


Explicit, look for <"foo"-Transition>  
If there is no explicit build-in animation, ask, do i want stand alone customn animation, then use `AnimationWidget`, if you want it to be a part of existing surrounding widget usew `AnimationBuilder`
