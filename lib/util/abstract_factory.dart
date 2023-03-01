import 'package:adwatcher/controller/database.dart';

class FactoryProvider {
  static late final AbstractFactory factory;
  static void initFactoryProvider(AbstractFactory abstractFactory) {
    factory = abstractFactory;
  }
}

abstract class AbstractFactory {
  AdWatcherDatabase getDatabase();
}
