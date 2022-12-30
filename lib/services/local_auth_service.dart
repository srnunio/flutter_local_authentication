import 'package:local_auth/local_auth.dart';

class LocalAuthService {
  final LocalAuthentication _auth = LocalAuthentication();

  /// [onCallBiometric] Requests authentication with biometrics if supported
  Future<bool?> onCallBiometric() async {
    try {
      var isDeviceSupported = await _auth.isDeviceSupported();

      var canCheckBiometrics = await _auth.canCheckBiometrics;

      if (!isDeviceSupported || !canCheckBiometrics) return null;

      var result = await _auth.authenticate(
          localizedReason: 'Tap the sensor',
          options: const AuthenticationOptions(
            stickyAuth: true,
            biometricOnly: true,
          ));

      canCheckBiometrics = await _auth.canCheckBiometrics;

      if (!canCheckBiometrics) return null;

      return result;
    } catch (error) {}

    return null;
  }

  /// [hasFace] checks whether Face ID is part of the
  /// authentication methods configured on the device
  Future<bool> hasFace() async {
    List<BiometricType> availableBiometrics =
        await _auth.getAvailableBiometrics();
    return availableBiometrics.contains(BiometricType.face) ||
        availableBiometrics.contains(BiometricType.strong);
  }

  /// [hasFingerprint] checks whether Fingerprint is part of the
  /// authentication methods configured on the device
  Future<bool> hasFingerprint() async {
    List<BiometricType> availableBiometrics =
        await _auth.getAvailableBiometrics();
    return availableBiometrics.contains(BiometricType.fingerprint);
  }
}
