// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_day_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CurrentDayStore on _CurrentDayStoreBase, Store {
  late final _$currentDayAtom =
      Atom(name: '_CurrentDayStoreBase.currentDay', context: context);

  @override
  DateTime get currentDay {
    _$currentDayAtom.reportRead();
    return super.currentDay;
  }

  @override
  set currentDay(DateTime value) {
    _$currentDayAtom.reportWrite(value, super.currentDay, () {
      super.currentDay = value;
    });
  }

  late final _$itemsAtom =
      Atom(name: '_CurrentDayStoreBase.items', context: context);

  @override
  List<Base> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<Base> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$tasksAtom =
      Atom(name: '_CurrentDayStoreBase.tasks', context: context);

  @override
  List<Task> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(List<Task> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$habitsAtom =
      Atom(name: '_CurrentDayStoreBase.habits', context: context);

  @override
  List<Habit> get habits {
    _$habitsAtom.reportRead();
    return super.habits;
  }

  @override
  set habits(List<Habit> value) {
    _$habitsAtom.reportWrite(value, super.habits, () {
      super.habits = value;
    });
  }

  late final _$_CurrentDayStoreBaseActionController =
      ActionController(name: '_CurrentDayStoreBase', context: context);

  @override
  void setCurrentDay(DateTime dateTime) {
    final _$actionInfo = _$_CurrentDayStoreBaseActionController.startAction(
        name: '_CurrentDayStoreBase.setCurrentDay');
    try {
      return super.setCurrentDay(dateTime);
    } finally {
      _$_CurrentDayStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void update() {
    final _$actionInfo = _$_CurrentDayStoreBaseActionController.startAction(
        name: '_CurrentDayStoreBase.update');
    try {
      return super.update();
    } finally {
      _$_CurrentDayStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentDay: ${currentDay},
items: ${items},
tasks: ${tasks},
habits: ${habits}
    ''';
  }
}
