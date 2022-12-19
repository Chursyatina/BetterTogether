import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'current_task_store.g.dart';

class CurrentTaskStore = _CurrentTaskStoreBase with _$CurrentTaskStore;

abstract class _CurrentTaskStoreBase with Store {

  @observable
  int? id;

  @observable
  String? name;

  @observable
  String? description;

  @observable
  DateTime? date;

  @observable
  DateTime? endDate;

  @observable 
  DateTime? startTime;

  @observable
  DateTime? endTime;

  @observable
  Color? color = Colors.blue;

  _CurrentTaskStoreBase(){

  }

  @action
  void setId(int id){
    this.id = id;
  }

  @action
  void setName(String name){
    this.name = name;
  }

  @action
  void setDescription(String description){
    this.description = description;
  }

  @action
  void setDate(DateTime date){
    this.date = date;
  }

  @action
  void setEndDate(DateTime endDate){
    this.endDate = endDate;
  }

  @action
  void setStartTime(DateTime startTime){
    this.startTime = startTime;
  }

  @action
  void setEndTime(DateTime endTime){
    this.endTime = endTime;
  }

  @action
  void setColor(Color color){
    this.color = color;
  }

  @action
  void nullStore(){

  this.id = null;

  this.name = null;

  this.description = null;

  this.date = null;

  this.endDate = null;

  this.startTime = null;

  this.endTime = null;

  this.color = null;
  }
}