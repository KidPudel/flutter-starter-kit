# Overview
The data that is displayed needs to be managed in android we would you something like `rememberStateOf` or `ViewModel` if we need to get something from and delegate it to state.  
In Flutter we could use `setState((){})` or `BloC` or `RiverPod` or `Provider`.

# Flutter `setState()` Approach
```dart
class CharacterListScreen extends StatefulWidget {
  @override
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  List<Character> characters = [];

  @override
  void initState() {
    super.initState();
    loadCharacters();
  }

  Future<void> loadCharacters() async {
    List<Character> characters = await CharacterRepository.getCharacters();
    setState(() {
      this.characters = characters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adventure Time Characters")),
      body: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(characters[index].name));
        },
      ),
    );
  }
}
```


# Flutter Bloc Approach
For a Dart application:
`bloc: ^8.0.0`
For a Flutter application:
`flutter_bloc: ^8.0.0`

```dart
class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterLoadingState());

  @override
  Stream<CharacterState> mapEventToState(CharacterEvent event) async* {
    if (event is LoadCharactersEvent) {
      yield CharacterLoadingState();
      try {
        List<Character> characters = await CharacterRepository.getCharacters();
        yield CharacterLoadedState(characters);
      } catch (e) {
        yield CharacterErrorState(e.toString());
      }
    }
  }
}

class CharacterListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final characterBloc = context.read<CharacterBloc>();
    characterBloc.add(LoadCharactersEvent());

    return Scaffold(
      appBar: AppBar(title: Text("Adventure Time Characters")),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoadingState) {
            return CircularProgressIndicator();
          } else if (state is CharacterLoadedState) {
            return ListView.builder(
              itemCount: state.characters.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.characters[index].name),
                );
              },
            );
          } else if (state is CharacterErrorState) {
            return Text(state.error);
          } else {
            return Container(); // Placeholder or empty state
          }
        },
      ),
    );
  }
}
```


# Flutter RiverPod Approach
```dart
final characterProvider = FutureProvider<List<Character>>((ref) async {
  return CharacterRepository.getCharacters();
});

class CharacterListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final charactersAsync = watch(characterProvider);
    
    return Scaffold(
      appBar: AppBar(title: Text("Adventure Time Characters")),
      body: charactersAsync.when(
        loading: () => CircularProgressIndicator(),
        error: (error, stackTrace) => Text(error.toString()),
        data: (characters) {
          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(characters[index].name));
            },
          );
        },
      ),
    );
  }
}
``
