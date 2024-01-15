```dart
useEffect((){
  // good place to intialize a stream
  print("Initialize")
  return (){
    // good place to dispose
    print("Disposed")
  }
}, [])
```

https://www.youtube.com/watch?v=hiqpPKF_fic
