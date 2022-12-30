import 'package:flutter_local_authentication/services/local_auth_service.dart';
import 'package:flutter_local_authentication/services/settings_service.dart';
import 'package:mobx/mobx.dart';

part 'local_auth_view_model.g.dart';

class LocalAuthConfigViewModel = _LocalAuthConfigViewModel
    with _$LocalAuthConfigViewModel;

abstract class _LocalAuthConfigViewModel with Store {
  final LocalAuthService _localAuthService = LocalAuthService();

  final SettingsService _settingsService = SettingsService();

  @observable
  bool _faceAvailable = false;

  @observable
  bool _fingerprintAvailable = false;

  @observable
  bool _isActiveLocalAuth = false;

  @computed
  bool get isActiveLocalAuth => _isActiveLocalAuth;

  @computed
  bool get faceAvailable => _faceAvailable;

  @computed
  bool get fingerprintAvailable => _fingerprintAvailable;

  @action
  void onEnableOrDisableLocalAuth(bool value) {
    _isActiveLocalAuth = value;
    if (value) {
      _settingsService.enableLocalAuth();
    } else {
      _settingsService.disableLocalAuth();
    }
  }

  @action
  Future<void> initialize() async {
    await _settingsService.initialize();

    /// Checks whether it has been selected as local authentication
    _isActiveLocalAuth = _settingsService.isActiveLocalAuth;

    _faceAvailable = await _localAuthService.hasFace();
    _fingerprintAvailable = await _localAuthService.hasFingerprint();

    if (_isActiveLocalAuth) onRequestAuth();
  }

  Future<bool?> onRequestAuth() async {
    return await _localAuthService.onCallBiometric();
  }
}
