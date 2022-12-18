import 'package:bettertogether/Models/Task.dart';
import 'package:bettertogether/stores/user_store.dart';
import 'package:mobx/mobx.dart';
import 'package:bettertogether/objectbox.g.dart' as box;
part 'task_store.g.dart';

class TaskRepository = _TaskRepositoryBase with _$TaskRepository;

abstract class _TaskRepositoryBase with Store {
  final box.Store store;
  final UserRepository userRepository;
  ObservableList<Task> tasks = ObservableList<Task>.of([]);

  _TaskRepositoryBase(this.store, this.userRepository) {
    getBooks(store).forEach(setNewList);
  }

  Stream<List<Task>> getBooks(box.Store store) {
    final query = store
    .box<Task>()
    .query(box.Task_.user.equals(userRepository.currentUser.id));
    return query
    .watch(triggerImmediately: true)
    .map<List<Task>>((query) => query.find());
  }

  @action
    void setNewList(List<Task> newBooks) {
    tasks.clear();
    tasks.addAll(newBooks);
  }

  void putHabit(Task habit) {
    habit.user.target = userRepository.currentUser;
    store.box<Task>().put(habit);
  }

  void removeHabit(Task habit) {
    store.box<Task>().remove(habit.id);
  }
}