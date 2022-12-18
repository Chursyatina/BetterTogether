// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CurrentTaskStore on _CurrentTaskStoreBase, Store {
  late final _$nameAtom =
      Atom(name: '_CurrentTaskStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_CurrentTaskStoreBase.description', context: context);

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

  late final _$dateAtom =
      Atom(name: '_CurrentTaskStoreBase.date', context: context);

  @override
  DateTime get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTime value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  late final _$_CurrentTaskStoreBaseActionController =
      ActionController(name: '_CurrentTaskStoreBase', context: context);

  @override
  void setName(String name) {
    final _$actionInfo = _$_CurrentTaskStoreBaseActionController.startAction(
        name: '_CurrentTaskStoreBase.setName');
    try {
      return super.setName(name);
    } finally {
      _$_CurrentTaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String description) {
    final _$actionInfo = _$_CurrentTaskStoreBaseActionController.startAction(
        name: '_CurrentTaskStoreBase.setDescription');
    try {
      return super.setDescription(description);
    } finally {
      _$_CurrentTaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(DateTime date) {
    final _$actionInfo = _$_CurrentTaskStoreBaseActionController.startAction(
        name: '_CurrentTaskStoreBase.setDate');
    try {
      return super.setDate(date);
    } finally {
      _$_CurrentTaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
description: ${description},
date: ${date}
    ''';
  }
}
