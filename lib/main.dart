import 'package:adwatcher/controller/database.dart';
import 'package:adwatcher/controller/redux/middleware.dart';
import 'package:adwatcher/controller/redux/reducer.dart';
import 'package:adwatcher/controller/redux/state.dart';
import 'package:adwatcher/model/character.dart';
import 'package:adwatcher/util/abstract_factory.dart';
import 'package:adwatcher/view/create_character.dart';
import 'package:adwatcher/view/home/home_screen.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

void main() {
  AdWatcherDatabase database = FactoryProvider.factory.getDatabase();
  AppState state = AppState();
  state.character = database.fetchCharacter();

  final store = Store<AppState>(
    reducer,
    initialState: state,
    middleware: [],
  );

  StreamProvider<T> fromStoreProvider<T>(T Function(AppState appState) convert) {
    return StreamProvider<T>(
      lazy: false,
      updateShouldNotify: (a, b) => !const DeepCollectionEquality().equals(a, b),
      create: (_) => store.onChange.map(convert),
      initialData: convert(store.state),
    );
  }

  store.onChange.listen((state) {
    if (state.character != null) {
      FactoryProvider.factory.getDatabase().saveCharacter(state.character!);
    }
  });

  final widget = MultiProvider(
    providers: [
      fromStoreProvider((appState) => appState.character),
      Provider.value(value: store),
    ],
    child: const MyApp(),
  );

  runApp(widget);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.green,
        textTheme: const TextTheme(
          titleLarge: TextStyle(),
          displayLarge: TextStyle(),
          bodyMedium: TextStyle(),
        ).apply(bodyColor: const Color(0xFF000000)),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith((state) => const Color(0xFFDBD7D2)),
          ),
        ),
      ),
      home: Consumer<Character?>(builder: (BuildContext context, character, Widget? child) {
        return character == null ? const CreateCharacterScreen() : const HomeScreen();
      }),
    );
  }
}
