import 'package:mqtt_demo/modules/core/managers/MQTT_manager.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;
void setupLocator() {
  serviceLocator.registerLazySingleton(() => MQTTManager());
}
