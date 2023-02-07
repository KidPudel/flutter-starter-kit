Basic concepts in Android development and their equivalent concepts in Flutter:

**Flutter uses Composition over Inheritance whenever it can. Here, instead of padding being an attribute of Text, it's a widget!
This way, widgets can focus on their single responsibility, and you, the developer, have total freedom in how to compose your UI. For example, you can use the Padding widget to pad text, images, buttons, your own custom widgets, or the whole app. The widget doesn't care what it's wrapping.**

1. `Activity` (Android) vs `StatefulWidget` (Flutter) - Both represent a single screen in an app, with the ability to update the UI based on user interactions or other events.

2. `Fragment` (Android) vs `StatefulWidget` (Flutter) - Both represent a portion of a screen in an app, which can be reused across multiple activities.

3. `Intent` (Android) vs `Navigator` (Flutter) - Both are used to navigate between screens in an app. An Intent is used to start a new Activity, while a Navigator is used to push and pop Routes in the app's navigation stack.

4. `XML` layout files (Android) vs `Build Methods` (Flutter) - Both are used to define the UI of a screen. In Android, the layout is defined using `XML`, while in Flutter, the layout is defined using a build method in a `StatefulWidget` or `StatelessWidget`.

5. `RecyclerView` (Android) vs `ListView` (Flutter) - Both are used to display a list of items in a scrollable view. A RecyclerView is a more flexible and powerful version of the ListView, but the basic idea is the same.

6. `SQLite` (Android) vs `sqflite` (Flutter) - Both are used to store and retrieve data from a local database. SQLite is the default database for Android, while sqflite is a popular third-party library for Flutter that provides a similar API.
