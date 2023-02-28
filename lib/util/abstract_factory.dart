import 'package:adwatcher/controller/database.dart';

class FactoryProvider {
  static AbstractFactory get factory {
    return AbstractFactoryMock();
  }
}

abstract class AbstractFactory {
  AdWatcherDatabase getDatabase();
}

class AbstractFactoryMock implements AbstractFactory {
  @override
  AdWatcherDatabase getDatabase() {
    return AdWatcherDatabaseMock();
  }
}
