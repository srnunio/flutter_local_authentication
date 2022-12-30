// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_auth_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocalAuthConfigViewModel on _LocalAuthConfigViewModel, Store {
  Computed<bool>? _$isActiveLocalAuthComputed;

  @override
  bool get isActiveLocalAuth => (_$isActiveLocalAuthComputed ??= Computed<bool>(
          () => super.isActiveLocalAuth,
          name: '_LocalAuthConfigViewModel.isActiveLocalAuth'))
      .value;
  Computed<bool>? _$faceAvailableComputed;

  @override
  bool get faceAvailable =>
      (_$faceAvailableComputed ??= Computed<bool>(() => super.faceAvailable,
              name: '_LocalAuthConfigViewModel.faceAvailable'))
          .value;
  Computed<bool>? _$fingerprintAvailableComputed;

  @override
  bool get fingerprintAvailable => (_$fingerprintAvailableComputed ??=
          Computed<bool>(() => super.fingerprintAvailable,
              name: '_LocalAuthConfigViewModel.fingerprintAvailable'))
      .value;

  late final _$_faceAvailableAtom =
      Atom(name: '_LocalAuthConfigViewModel._faceAvailable', context: context);

  @override
  bool get _faceAvailable {
    _$_faceAvailableAtom.reportRead();
    return super._faceAvailable;
  }

  @override
  set _faceAvailable(bool value) {
    _$_faceAvailableAtom.reportWrite(value, super._faceAvailable, () {
      super._faceAvailable = value;
    });
  }

  late final _$_fingerprintAvailableAtom = Atom(
      name: '_LocalAuthConfigViewModel._fingerprintAvailable',
      context: context);

  @override
  bool get _fingerprintAvailable {
    _$_fingerprintAvailableAtom.reportRead();
    return super._fingerprintAvailable;
  }

  @override
  set _fingerprintAvailable(bool value) {
    _$_fingerprintAvailableAtom.reportWrite(value, super._fingerprintAvailable,
        () {
      super._fingerprintAvailable = value;
    });
  }

  late final _$_isActiveLocalAuthAtom = Atom(
      name: '_LocalAuthConfigViewModel._isActiveLocalAuth', context: context);

  @override
  bool get _isActiveLocalAuth {
    _$_isActiveLocalAuthAtom.reportRead();
    return super._isActiveLocalAuth;
  }

  @override
  set _isActiveLocalAuth(bool value) {
    _$_isActiveLocalAuthAtom.reportWrite(value, super._isActiveLocalAuth, () {
      super._isActiveLocalAuth = value;
    });
  }

  late final _$initializeAsyncAction =
      AsyncAction('_LocalAuthConfigViewModel.initialize', context: context);

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  late final _$_LocalAuthConfigViewModelActionController =
      ActionController(name: '_LocalAuthConfigViewModel', context: context);

  @override
  void onEnableOrDisableLocalAuth(bool value) {
    final _$actionInfo =
        _$_LocalAuthConfigViewModelActionController.startAction(
            name: '_LocalAuthConfigViewModel.onEnableOrDisableLocalAuth');
    try {
      return super.onEnableOrDisableLocalAuth(value);
    } finally {
      _$_LocalAuthConfigViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isActiveLocalAuth: ${isActiveLocalAuth},
faceAvailable: ${faceAvailable},
fingerprintAvailable: ${fingerprintAvailable}
    ''';
  }
}
