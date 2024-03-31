import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modules/core/managers/MQTT_manager.dart';
import 'modules/helpers/screen_route.dart';
import 'modules/helpers/service_locator.dart';
import 'modules/message/screen/message_screen.dart';
import 'modules/settings/screen/settings_screen.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MQTTManager>(
      create: (context) => serviceLocator<MQTTManager>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          routes: {
            '/': (BuildContext context) => MessageScreen(),
            SETTINGS_ROUTE: (BuildContext context) => SettingsScreen(),
          }),
    );
  }
}
