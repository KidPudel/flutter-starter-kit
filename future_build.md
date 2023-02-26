Builds iteself based on the interaction with Future

```dart
@override
  Widget build(BuildContext context) {
    final myColors = MyColors.of(context);
    return FutureBuilder<List<Character>>(
      future: _getCharacters(),
      builder: (context, AsyncSnapshot<List<Character>> characters) {
        if (characters.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Flutter time"),
            ),
            body: Row(
              children: [
                Expanded(
                    child: Container(
                  color: myColors?.bakerMilkPink,
                  child: ListView.builder(
                    // code
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
```
