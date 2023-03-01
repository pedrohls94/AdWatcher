import 'package:adwatcher/controller/database.dart';
import 'package:adwatcher/util/abstract_factory.dart';
import 'package:adwatcher/util/mocks/database_mock.dart';

class AbstractFactoryMock implements AbstractFactory {
  late AdWatcherDatabaseMock _database;

  static Future<AbstractFactoryMock> createFactory() async {
    AbstractFactoryMock factory = AbstractFactoryMock();
    factory._database = AdWatcherDatabaseMock();
    return factory;
  }

  @override
  AdWatcherDatabase getDatabase() {
    return _database;
  }
}
