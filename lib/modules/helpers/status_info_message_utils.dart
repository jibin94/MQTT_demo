import 'package:mqtt_demo/modules/core/models/MQTT_app_state.dart';

String prepareStateMessageFrom(MQTTAppConnectionState state) {
  switch (state) {
    case MQTTAppConnectionState.connected:
      return 'Connected';
    case MQTTAppConnectionState.connecting:
      return 'Connecting';
    case MQTTAppConnectionState.disconnected:
      return 'Disconnected';
    case MQTTAppConnectionState.connectedSubscribed:
      return 'Subscribed';
    case MQTTAppConnectionState.connectedUnSubscribed:
      return 'Unsubscribed';
  }
}