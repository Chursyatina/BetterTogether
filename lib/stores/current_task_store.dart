import 'package:mobx/mobx.dart';
part 'current_task_store.g.dart';

class CurrentTaskStore = _CurrentTaskStoreBase with _$CurrentTaskStore;

abstract class _CurrentTaskStoreBase with Store {
  @observable
  String name = '';

  @observable
  String description = '';

  @observable
  DateTime date = DateTime.now();

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
}