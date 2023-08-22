# What is it?
get_it is the package for dependency injection, it belongs to a **service locator design patter**.  
![image](https://user-images.githubusercontent.com/63263301/219618276-a9c92526-5005-4e03-8cc2-ae34edc2d806.png)

Allows you to **_register different services at one single place_** and **_access it by the search inside of the getted package_**.  
You can register once, like a singleton and then use it over and over again, no matter where you are in the widget tree, you can just call get_it, ask for the specific service and then execute any method you'd like.  
**It will not update your UI**, but you can update with Inherited Widget

# How to use it?
firstly define your dependencies here
```dart
final locator = GetIt.instance();
void inject() {
  locator.registerSingleton<Dio>(Dio(BaseOptions(contextType: 'application/json')));
  // to inject inside dependency
  locator.registerSingleton<SuperGoodApi>(SuperGoodApi(locator<Dio>())) // or use locator.get<Dio>();
  locator.registerLazy<IMenuRepository>(() => MenuRepository());
}
```

now add this function to the root main
```dart
void main() {
  inject();
  runApp(Application());
}
```

and to use it just call

```dart
void menuRepository = locator.get<IMenuRepository>();
```
