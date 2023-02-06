# How to center element?


take this for example:  

```dart
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Text("data")
    );
  }
```
as a result we have:  
![image](https://user-images.githubusercontent.com/63263301/216997729-321f509c-3425-44ee-a2b6-b96d5616d082.png)

Yeahh... it's not good at all.  

So, to center element we need Column and Row  

If we add column, we can position it vertically:  

```dart
body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Text("data")
        ],
      )
```

![image](https://user-images.githubusercontent.com/63263301/216998518-87e82625-de9b-44e3-a0f7-afe89d5866af.png)

Now we need to add row:  

```dart
body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text("data")
              ],
            )
            ],
        )
```

![image](https://user-images.githubusercontent.com/63263301/216999277-b167b406-82b5-4cd2-a29d-e3ccb2d8de4a.png)

But we're not done, because if we have couple of objects and if want to move just parts of childer around, we have a problems:

```dart
body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.cyan,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("data"),
                ],
              ),
            ),
            Container(
              color: Colors.redAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("data"),
                ],
              ),
            ),
          ],
        )
```

![image](https://user-images.githubusercontent.com/63263301/217004315-9af4fc67-4c5f-4523-ba96-1e9dba699040.png)


```dart
body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
```

![image](https://user-images.githubusercontent.com/63263301/217005516-6e6645d8-77c7-4b73-9933-9ae1b01492db.png)

so to prevent that, we can use `Expanded` Widget that expands a child of Column, Row or Flex, so that the child fills all the available space.


```dart
body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(flex: 1, child: Container(
              color: Colors.cyan,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text("data"),
                ],
              ),
            ),),
            Expanded(flex: 1, child: Container(
              color: Colors.redAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("data"),
                ],
              ),
            ),),
          ],
        )
```
![image](https://user-images.githubusercontent.com/63263301/217007869-9479a8bc-7cb2-4c52-aeba-52d7fa037680.png)

And now you can position your elements inside, however you want:  

```dart
Expanded(flex: 1, child: Container(
              color: Colors.cyan,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text("data"),
                ],
              ),
            ),),
```

![image](https://user-images.githubusercontent.com/63263301/217008427-d1098ec0-ea32-440c-a40e-217a58df7bea.png)
