// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_habit_sttore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CurrentHabitStore on _CurrentHabitStoreBase, Store {
  late final _$idAtom =
      Atom(name: '_CurrentHabitStoreBase.id', context: context);

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
      Atom(name: '_CurrentHabitStoreBase.name', context: context);

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
      Atom(name: '_CurrentHabitStoreBase.description', context: context);

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

  late final _$dayOfCreationAtom =
      Atom(name: '_CurrentHabitStoreBase.dayOfCreation', context: context);

  @override
  DateTime? get dayOfCreation {
    _$dayOfCreationAtom.reportRead();
    return super.dayOfCreation;
  }

  @override
  set dayOfCreation(DateTime? value) {
    _$dayOfCreationAtom.reportWrite(value, super.dayOfCreation, () {
      super.dayOfCreation = value;
    });
  }

  late final _$startTimeAtom =
      Atom(name: '_CurrentHabitStoreBase.startTime', context: context);

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
      Atom(name: '_CurrentHabitStoreBase.endTime', context: context);

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
      Atom(name: '_CurrentHabitStoreBase.color', context: context);

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

  late final _$_CurrentHabitStoreBaseActionController =
      ActionController(name: '_CurrentHabitStoreBase', context: context);

  @override
  void setId(int id) {
    final _$actionInfo = _$_CurrentHabitStoreBaseActionController.startAction(
        name: '_CurrentHabitStoreBase.setId');
    try {
      return super.setId(id);
    } finally {
      _$_CurrentHabitStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String name) {
    final _$actionInfo = _$_CurrentHabitStoreBaseActionController.startAction(
        name: '_CurrentHabitStoreBase.setName');
    try {
      return super.setName(name);
    } finally {
      _$_CurrentHabitStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String description) {
    final _$actionInfo = _$_CurrentHabitStoreBaseActionController.startAction(
        name: '_CurrentHabitStoreBase.setDescription');
    try {
      return super.setDescription(description);
    } finally {
      _$_CurrentHabitStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStartTime(DateTime startTime) {
    final _$actionInfo = _$_CurrentHabitStoreBaseActionController.startAction(
        name: '_CurrentHabitStoreBase.setStartTime');
    try {
      return super.setStartTime(startTime);
    } finally {
      _$_CurrentHabitStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEndTime(DateTime endTime) {
    final _$actionInfo = _$_CurrentHabitStoreBaseActionController.startAction(
        name: '_CurrentHabitStoreBase.setEndTime');
    try {
      return super.setEndTime(endTime);
    } finally {
      _$_CurrentHabitStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setColor(Color color) {
    final _$actionInfo = _$_CurrentHabitStoreBaseActionController.startAction(
        name: '_CurrentHabitStoreBase.setColor');
    try {
      return super.setColor(color);
    } finally {
      _$_CurrentHabitStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nullStore() {
    final _$actionInfo = _$_CurrentHabitStoreBaseActionController.startAction(
        name: '_CurrentHabitStoreBase.nullStore');
    try {
      return super.nullStore();
    } finally {
      _$_CurrentHabitStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
description: ${description},
dayOfCreation: ${dayOfCreation},
startTime: ${startTime},
endTime: ${endTime},
color: ${color}
    ''';
  }
}
