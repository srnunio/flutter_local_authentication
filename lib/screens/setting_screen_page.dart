import 'package:custom_switch_widget/custom_switch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../view_model/local_auth_view_model.dart';
import 'auth_method_component.dart';

class SettingScreenPage extends StatefulWidget {
  @override
  State<SettingScreenPage> createState() => _SettingScreenPageState();
}

class _SettingScreenPageState extends State<SettingScreenPage> {
  final LocalAuthConfigViewModel _viewModel = LocalAuthConfigViewModel();

  final CustomSwitchController _controllerByAuth =
      CustomSwitchController(initialValue: false);

  void showMessage(String message) {
    showDialog<dynamic>(
        context: context,
        barrierLabel: 'OK',
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              child: Text(message),
              padding: EdgeInsets.all(30.0),
            ),
          );
        });
  }

  /// [onChangeAuth] enable or disable Face ID
  void onChangeAuth(bool state) async {
    var result = await _viewModel.onRequestAuth();

    if (result == null) {
      showMessage('Unconfirmed identity');
      return;
    }

    if (_viewModel.isActiveLocalAuth && result) {
      _viewModel.onEnableOrDisableLocalAuth(false);
    } else if (!_viewModel.isActiveLocalAuth && result) {
      _viewModel.onEnableOrDisableLocalAuth(true);
    } else {
      showMessage('Unconfirmed identity');
    }
  }

  Widget _unavailableBiometricBody() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white12, borderRadius: BorderRadius.circular(16.0)),
        child: const ListTile(
          leading: Icon(
            Icons.info_outline,
            color: Colors.white,
          ),
          title: Text(
            'Unavailable Biometric',
            style: TextStyle(color: Colors.red),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();

    /// monitors any changes that occur in isFingerprint or Face ID
    reaction<bool>((_) => _viewModel.isActiveLocalAuth, (state) {
      if (state) {
        _controllerByAuth.enable();
      } else {
        _controllerByAuth.disable();
      }
    });

    _viewModel.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        var faceAvailable = _viewModel.faceAvailable;
        var fingerprintAvailable = _viewModel.fingerprintAvailable;

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
                if (!faceAvailable && !fingerprintAvailable)
                  _unavailableBiometricBody(),
                if (faceAvailable && fingerprintAvailable)
                  AuthMethodComponent(
                    title: "Enable Local Authentication",
                    iconData: Icons.privacy_tip_outlined,
                    isAvailable: _viewModel.faceAvailable,
                    controller: _controllerByAuth,
                    onChange: onChangeAuth,
                  ),
                if (faceAvailable && !fingerprintAvailable)
                  AuthMethodComponent(
                    title: "Face ID",
                    iconData: Icons.tag_faces_outlined,
                    isAvailable: _viewModel.faceAvailable,
                    controller: _controllerByAuth,
                    onChange: onChangeAuth,
                  ),
                if (fingerprintAvailable && !faceAvailable)
                  AuthMethodComponent(
                    title: "Fingerprint",
                    iconData: Icons.fingerprint,
                    isAvailable: _viewModel.fingerprintAvailable,
                    controller: _controllerByAuth,
                    onChange: onChangeAuth,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
