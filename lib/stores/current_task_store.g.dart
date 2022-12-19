// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CurrentTaskStore on _CurrentTaskStoreBase, Store {
  late final _$idAtom =
      Atom(name: '_CurrentTaskStoreBase.id', context: context);

  @override
  int? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$nameAtom =
      Atom(name: '_CurrentTaskStoreBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_CurrentTaskStoreBase.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$dateAtom =
      Atom(name: '_CurrentTaskStoreBase.date', context: context);

  @override
  DateTime? get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTime? value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  late final _$endDateAtom =
      Atom(name: '_CurrentTaskStoreBase.endDate', context: context);

  @override
  DateTime? get endDate {
    _$endDateAtom.reportRead();
    return super.endDate;
  }

  @override
  set endDate(DateTime? value) {
    _$endDateAtom.reportWrite(value, super.endDate, () {
      super.endDate = value;
    });
  }

  late final _$startTimeAtom =
      Atom(name: '_CurrentTaskStoreBase.startTime', context: context);

  @override
  DateTime? get startTime {
    _$startTimeAtom.reportRead();
    return super.startTime;
  }

  @override
  set startTime(DateTime? value) {
    _$startTimeAtom.reportWrite(value, super.startTime, () {
      super.startTime = value;
    });
  }

  late final _$endTimeAtom =
      Atom(name: '_CurrentTaskStoreBase.endTime', context: context);

  @override
  DateTime? get endTime {
    _$endTimeAtom.reportRead();
    return super.endTime;
  }

  @override
  set endTime(DateTime? value) {
    _$endTimeAtom.reportWrite(value, super.endTime, () {
      super.endTime = value;
    });
  }

  late final _$colorAtom =
      Atom(name: '_CurrentTaskStoreBase.color', context: context);

  @override
  Color? get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(Color? value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  late final _$_CurrentTaskStoreBaseActionController =
      ActionController(name: '_CurrentTaskStoreBase', context: context);

  @override
  void setId(int id) {
    final _$actionInfo = _$_CurrentTaskStoreBaseActionController.startAction(
        name: '_CurrentTaskStoreBase.setId');
    try {
      return super.setId(id);
    } finally {
      _$_CurrentTaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void setEndDate(DateTime endDate) {
    final _$actionInfo = _$_CurrentTaskStoreBaseActionController.startAction(
        name: '_CurrentTaskStoreBase.setEndDate');
    try {
      return super.setEndDate(endDate);
    } finally {
      _$_CurrentTaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStartTime(DateTime startTime) {
    final _$actionInfo = _$_CurrentTaskStoreBaseActionController.startAction(
        name: '_CurrentTaskStoreBase.setStartTime');
    try {
      return super.setStartTime(startTime);
    } finally {
      _$_CurrentTaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEndTime(DateTime endTime) {
    final _$actionInfo = _$_CurrentTaskStoreBaseActionController.startAction(
        name: '_CurrentTaskStoreBase.setEndTime');
    try {
      return super.setEndTime(endTime);
    } finally {
      _$_CurrentTaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setColor(Color color) {
    final _$actionInfo = _$_CurrentTaskStoreBaseActionController.startAction(
        name: '_CurrentTaskStoreBase.setColor');
    try {
      return super.setColor(color);
    } finally {
      _$_CurrentTaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nullStore() {
    final _$actionInfo = _$_CurrentTaskStoreBaseActionController.startAction(
        name: '_CurrentTaskStoreBase.nullStore');
    try {
      return super.nullStore();
    } finally {
      _$_CurrentTaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
description: ${description},
date: ${date},
endDate: ${endDate},
startTime: ${startTime},
endTime: ${endTime},
color: ${color}
    ''';
  }
}
