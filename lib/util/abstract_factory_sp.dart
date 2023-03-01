import 'package:adwatcher/controller/database.dart';
import 'package:adwatcher/controller/database_shared_preferences.dart';
import 'package:adwatcher/util/abstract_factory.dart';

class AbstractFactorySP implements AbstractFactory {
  late AdWatcherSharedPreferencesDatabase _database;

  static Future<AbstractFactorySP> createFactory() async {
    AbstractFactorySP factory = AbstractFactorySP();
    factory._database = await AdWatcherSharedPreferencesDatabase.createDatabase2();
    return factory;
  }

  @override
  AdWatcherDatabase getDatabase() {
    return _database;
  }
}
