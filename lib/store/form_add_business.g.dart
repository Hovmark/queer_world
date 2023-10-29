// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_add_business.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormAddBusinessStore on _FormAddBusinessStore, Store {
  Computed<bool>? _$isBusinessCheckPendingComputed;

  @override
  bool get isBusinessCheckPending => (_$isBusinessCheckPendingComputed ??=
          Computed<bool>(() => super.isBusinessCheckPending,
              name: '_FormAddBusinessStore.isBusinessCheckPending'))
      .value;

  late final _$businessAtom =
      Atom(name: '_FormAddBusinessStore.business', context: context);

  @override
  String get business {
    _$businessAtom.reportRead();
    return super.business;
  }

  @override
  set business(String value) {
    _$businessAtom.reportWrite(value, super.business, () {
      super.business = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_FormAddBusinessStore.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$websiteAtom =
      Atom(name: '_FormAddBusinessStore.website', context: context);

  @override
  String get website {
    _$websiteAtom.reportRead();
    return super.website;
  }

  @override
  set website(String value) {
    _$websiteAtom.reportWrite(value, super.website, () {
      super.website = value;
    });
  }

  late final _$businessnameCheckAtom =
      Atom(name: '_FormAddBusinessStore.businessnameCheck', context: context);

  @override
  ObservableFuture<bool> get businessnameCheck {
    _$businessnameCheckAtom.reportRead();
    return super.businessnameCheck;
  }

  @override
  set businessnameCheck(ObservableFuture<bool> value) {
    _$businessnameCheckAtom.reportWrite(value, super.businessnameCheck, () {
      super.businessnameCheck = value;
    });
  }

  late final _$validateBusinessnameAsyncAction = AsyncAction(
      '_FormAddBusinessStore.validateBusinessname',
      context: context);

  @override
  Future<dynamic> validateBusinessname(String value) {
    return _$validateBusinessnameAsyncAction
        .run(() => super.validateBusinessname(value));
  }

  late final _$addBusinessRequestAsyncAction =
      AsyncAction('_FormAddBusinessStore.addBusinessRequest', context: context);

  @override
  Future<DocumentReference<Object?>> addBusinessRequest() {
    return _$addBusinessRequestAsyncAction
        .run(() => super.addBusinessRequest());
  }

  late final _$_FormAddBusinessStoreActionController =
      ActionController(name: '_FormAddBusinessStore', context: context);

  @override
  void addTag(String tag) {
    final _$actionInfo = _$_FormAddBusinessStoreActionController.startAction(
        name: '_FormAddBusinessStore.addTag');
    try {
      return super.addTag(tag);
    } finally {
      _$_FormAddBusinessStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTag(String tag) {
    final _$actionInfo = _$_FormAddBusinessStoreActionController.startAction(
        name: '_FormAddBusinessStore.removeTag');
    try {
      return super.removeTag(tag);
    } finally {
      _$_FormAddBusinessStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_FormAddBusinessStoreActionController.startAction(
        name: '_FormAddBusinessStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_FormAddBusinessStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_FormAddBusinessStoreActionController.startAction(
        name: '_FormAddBusinessStore.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_FormAddBusinessStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
business: ${business},
description: ${description},
website: ${website},
businessnameCheck: ${businessnameCheck},
isBusinessCheckPending: ${isBusinessCheckPending}
    ''';
  }
}

mixin _$FormErrorState on _FormErrorState, Store {
  Computed<bool>? _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors,
              name: '_FormErrorState.hasErrors'))
          .value;

  late final _$businessnameAtom =
      Atom(name: '_FormErrorState.businessname', context: context);

  @override
  String? get businessname {
    _$businessnameAtom.reportRead();
    return super.businessname;
  }

  @override
  set businessname(String? value) {
    _$businessnameAtom.reportWrite(value, super.businessname, () {
      super.businessname = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_FormErrorState.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_FormErrorState.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  @override
  String toString() {
    return '''
businessname: ${businessname},
email: ${email},
password: ${password},
hasErrors: ${hasErrors}
    ''';
  }
}
