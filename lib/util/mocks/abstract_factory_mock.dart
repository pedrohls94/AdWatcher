import 'package:adwatcher/controller/database.dart';
import 'package:adwatcher/util/abstract_factory.dart';
import 'package:adwatcher/util/mocks/database_mock.dart';

class AbstractFactoryMock implements AbstractFactory {
  @override
  AdWatcherDatabase getDatabase() {
    return AdWatcherDatabaseMock.sharedInstance();
  }
}