import 'package:adwatcher/controller/database.dart';
import 'package:adwatcher/util/mocks/abstract_factory_mock.dart';

class FactoryProvider {
  static AbstractFactory get factory {
    return AbstractFactoryMock();
  }
}

abstract class AbstractFactory {
  AdWatcherDatabase getDatabase();
}
