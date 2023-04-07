import 'package:adwatcher/controller/database.dart';
import 'package:adwatcher/controller/redux/reducer.dart';
import 'package:adwatcher/controller/redux/state.dart';
import 'package:adwatcher/model/character.dart';
import 'package:adwatcher/util/abstract_factory.dart';
import 'package:adwatcher/util/abstract_factory_sp.dart';
import 'package:adwatcher/view/character_creation/character_creation_screen.dart';
import 'package:adwatcher/view/home/home_screen.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  FactoryProvider.initFactoryProvider(await AbstractFactorySP.createFactory());

  AdWatcherDatabase database = FactoryProvider.factory.getDatabase();
  AdWatcherState state = AdWatcherState();
  state.character = database.fetchCharacter();

  final store = Store<AdWatcherState>(
    reducer,
    initialState: state,
    middleware: [],
  );

  StreamProvider<T> createStreamProvider<T>(T Function(AdWatcherState appState) convert) {
    return StreamProvider<T>(
      lazy: false,
      updateShouldNotify: (one, other) => !const DeepCollectionEquality().equals(one, other),
      create: (_) => store.onChange.map(convert),
      initialData: convert(store.state),
    );
  }

  store.onChange.listen((state) {
    if (state.character != null) {
      database.saveCharacter(state.character!);
    }
  });

  final widget = MultiProvider(
    providers: [
      createStreamProvider((appState) => appState.character),
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
            foregroundColor: MaterialStateProperty.resolveWith((state) => const Color(0xFF000000)),//0xFFDBD7D2)),
          ),
        ),
      ),
      home: Consumer<Character?>(builder: (BuildContext context, character, Widget? child) {
        return character == null ? const CharacterCreationScreen() : const HomeScreen();
      }),
    );
  }
}
