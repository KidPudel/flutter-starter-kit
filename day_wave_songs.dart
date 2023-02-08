import 'dart:ffi';
import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: "Flutter app",
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        ),
        home: HomeScreen(),
      ),
    );
  }
}

class AppState extends ChangeNotifier {
  var songs = List.from(["Hard To Read", "Something Here", "Wasting Time"]);
  var favourites = <String>[];
  String song = "";

  AppState() {
    song = songs.elementAt(0);
  }

  void nextSong() {
    song = songs.elementAt((songs.indexOf(song) + 1 == songs.length)
        ? 0
        : songs.indexOf(song) + 1);
    notifyListeners();
  }

  void setFavourites() {
    if (favourites.contains(song)) {
      favourites.remove(song);
    } else {
      favourites.add(song);
    }
    notifyListeners();
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (currentIndex) {
      case 0:
        page = SongsPage();
        break;
      case 1:
        page = FavouritesPage();
        break;
      default:
        throw UnimplementedError("Widget with $currentIndex doesn't exist");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Day Wave songs"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              child: page,
            ),
          ),
          SafeArea(
              child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favourites"),
            ],
            currentIndex: currentIndex,
            onTap: (indexOfItem) {
              setState(() {
                currentIndex = indexOfItem;
              });
              print(indexOfItem);
            },
          )),
        ],
      ),
    );
  }
}

class SongsPage extends StatelessWidget {
  const SongsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<AppState>();
    var theme = Theme.of(context);
    var textStyle = theme.textTheme.bodyMedium
        ?.copyWith(color: theme.colorScheme.onPrimary);
    var backgroundColor = theme.colorScheme.primary;
    var song = state.song;
    var icon = (state.favourites.contains(song))
        ? Icons.favorite
        : Icons.favorite_border;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Change color of the background", style: textStyle),
            BigCard(song: song),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                    icon: Icon(icon),
                    label: const Text("Like"),
                    onPressed: () => {state.setFavourites()}),
                const SizedBox(width: 20),
                ElevatedButton(
                  child: const Text("Next"),
                  onPressed: () => {state.nextSong()},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.song,
  });

  final String song;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textStyle = theme.textTheme.bodyLarge?.copyWith(
        color: theme.colorScheme.onSurface, fontWeight: FontWeight.bold);
    return Card(
      color: theme.colorScheme.surface,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          song,
          style: textStyle,
        ),
      ),
    );
  }
}

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<AppState>();
    var theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: SizedBox(
                height: 200.0,
                child: ListView.builder(
                  itemCount: state.favourites.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 400,
                          child: Card(
                            color: theme.colorScheme.surface,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    state.favourites.elementAt(index),
                                    style: theme.textTheme.bodyLarge
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ))
      ],
    );
  }
}
