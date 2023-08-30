`PageView` is the way to create a swipeable pages !!! how cool is that?  
![image](https://github.com/KidPudel/flutter-starter-kit/assets/63263301/534bcd87-6fe5-4464-87c1-c123436fbb18)  

And it is very easy to set up
1. create a list of you pages
```dart
final _pages = [
    const ProfilePage(),
    const MenuPage(),
    const SpecialOfferPage(),
  ];
```
2. now add PageView or PageView.builder to create it dynamically
```dart
return Scaffold(
      appBar: _shellSliverAppBarWithSpecialOffers(),
      body: PageView.builder(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _pages.length,
          onPageChanged: (value) => setState(() {
                _activePage = value;
              }),
          itemBuilder: (context, index) => _pages[index]),
    );
```

3. we can add controller
```dart
final _pageController = PageController(initialPage: _PageNumbers.menu.index);
```

4. to animate between pages
```dart
_pageController.animateToPage(_PageNumbers.specialOffers.index,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.linear);
``` 

