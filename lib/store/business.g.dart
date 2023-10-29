// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Business on _Business, Store {
  late final _$tagsAtom = Atom(name: '_Business.tags', context: context);

  @override
  List<String> get tags {
    _$tagsAtom.reportRead();
    return super.tags;
  }

  @override
  set tags(List<String> value) {
    _$tagsAtom.reportWrite(value, super.tags, () {
      super.tags = value;
    });
  }

  late final _$_BusinessActionController =
      ActionController(name: '_Business', context: context);

  @override
  void addTag(String tag) {
    final _$actionInfo =
        _$_BusinessActionController.startAction(name: '_Business.addTag');
    try {
      return super.addTag(tag);
    } finally {
      _$_BusinessActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTag(String tag) {
    final _$actionInfo =
        _$_BusinessActionController.startAction(name: '_Business.removeTag');
    try {
      return super.removeTag(tag);
    } finally {
      _$_BusinessActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tags: ${tags}
    ''';
  }
}
