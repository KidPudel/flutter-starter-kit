```dart
void _showSnackBar(BuildContext context) async {
    await _getCharacters();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            "Navigate to character list, but i can tell that first is ${characters.isNotEmpty ? characters.first.fullName : "oops.. it isn't ready yet.."}"),
      ),
    );
  }
```
