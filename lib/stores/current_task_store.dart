import 'package:mobx/mobx.dart';
part 'current_task_store.g.dart';

class CurrentTaskStore = _CurrentTaskStoreBase with _$CurrentTaskStore;

abstract class _CurrentTaskStoreBase with Store {
  @observable
  String name = '';

  @observable
  String description = '';

  @action
  void setName(String name){
    this.name = name;
  }

  @action
  void setDescription(String description){
    this.description = description;
  }
}