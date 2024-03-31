import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mqtt_demo/modules/core/managers/MQTT_manager.dart';
import 'package:mqtt_demo/modules/core/models/MQTT_app_state.dart';
import 'package:mqtt_demo/modules/core/widgets/status_bar.dart';
import 'package:mqtt_demo/modules/helpers/status_info_message_utils.dart';
import 'package:provider/provider.dart';
import '../../helpers/client_id_generator.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _hostTextController = TextEditingController();
  late MQTTManager _manager;

  @override
  void dispose() {
    super.dispose();
    _hostTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _manager = Provider.of<MQTTManager>(context);
    return Scaffold(
      appBar: _buildAppBar(context) as PreferredSizeWidget?,
      body: _manager.currentState == null
          ? CircularProgressIndicator()
          : _buildColumn(_manager),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
          color: Colors.white
      ),
      title: const Text('Settings',style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.blueAccent,
    );
  }

  Widget _buildColumn(MQTTManager manager) {
    return Column(
      children: <Widget>[
        StatusBar(
            statusMessage: prepareStateMessageFrom(
                manager.currentState.getAppConnectionState)),
        _buildEditableColumn(manager.currentState),
      ],
    );
  }

  Widget _buildEditableColumn(MQTTAppState currentAppState) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          _buildTextFieldWith(_hostTextController, 'Enter broker address',
              currentAppState.getAppConnectionState),
          const SizedBox(height: 10),
          _buildConnectedButtonFrom(currentAppState.getAppConnectionState)
        ],
      ),
    );
  }

  Widget _buildTextFieldWith(TextEditingController controller, String hintText,
      MQTTAppConnectionState state) {
    bool shouldEnable = false;
    if ((controller == _hostTextController &&
        state == MQTTAppConnectionState.disconnected)) {
      shouldEnable = true;
    } else if (controller == _hostTextController && _manager.host != null) {
      _hostTextController.text = _manager.host!;
    }
    return TextField(
      enabled: shouldEnable,
      controller: controller,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 0, bottom: 0, top: 0, right: 0),
        labelText: hintText,
      ),
    );
  }

  Widget _buildConnectedButtonFrom(MQTTAppConnectionState state) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent),
            child: const Text('Connect',style: TextStyle(color: Colors.white)),
            onPressed: state == MQTTAppConnectionState.disconnected
                ? _configureAndConnect
                : null, //
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            child: const Text('Disconnect',style: TextStyle(color: Colors.white)),
            onPressed: state != MQTTAppConnectionState.disconnected
                ? _disconnect
                : null, //
          ),
        ),
      ],
    );
  }

  void _configureAndConnect() {
    String clientId = generateRandomClientId();
    String osPrefix = 'iOS_$clientId';
    if (Platform.isAndroid) {
      osPrefix = 'Android_$clientId';
    }
    _manager.initializeMQTTClient(
        host: _hostTextController.text, identifier: osPrefix);
    _manager.connect();
  }

  void _disconnect() {
    _manager.disconnect();
  }
}
