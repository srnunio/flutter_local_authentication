import 'package:custom_switch_widget/custom_switch_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'auth_option_component.dart';

class SettingScreenPage extends StatefulWidget {
  @override
  State<SettingScreenPage> createState() => _SettingScreenPageState();
}

class _SettingScreenPageState extends State<SettingScreenPage> {
  final CustomSwitchController _controllerByFaceID =
      CustomSwitchController(initialValue: false);

  final CustomSwitchController _controllerByFingerprint =
      CustomSwitchController(initialValue: false);

  void onChangeFaceID(bool state) {}

  void onChangeFingerprint(bool state) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Settings"),
        centerTitle: false,
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: [
            AuthOptionComponent(
              title: "Face ID",
              iconData: Icons.tag_faces_outlined,
              isAvailable: false,
              controller: _controllerByFaceID,
              onChange: onChangeFaceID,
            ),
            const SizedBox(
              height: 10.0,
            ),
            AuthOptionComponent(
              title: "Fingerprint",
              iconData: Icons.fingerprint,
              isAvailable: false,
              controller: _controllerByFingerprint,
              onChange: onChangeFingerprint,
            ),
          ],
        ),
      ),
    );
  }
}
