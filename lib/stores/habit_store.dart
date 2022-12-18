import 'package:bettertogether/Models/Habit.dart';
import 'package:bettertogether/stores/user_store.dart';
import 'package:mobx/mobx.dart';
import 'package:bettertogether/objectbox.g.dart' as box;
part 'habit_store.g.dart';

class HabitRepository = _HabitRepositoryBase with _$HabitRepository;

abstract class _HabitRepositoryBase with Store {
  final box.Store store;
  final UserRepository userRepository;
  ObservableList<Habit> books = ObservableList<Habit>.of([]);

  _HabitRepositoryBase(this.store, this.userRepository) {
    getBooks(store).forEach(setNewList);
  }

  Stream<List<Habit>> getBooks(box.Store store) {
    final query = store
    .box<Habit>()
    .query(box.Habit_.user.equals(userRepository.currentUser.id));
    return query
    .watch(triggerImmediately: true)
    .map<List<Habit>>((query) => query.find());
  }

  @action
    void setNewList(List<Habit> newBooks) {
    books.clear();
    books.addAll(newBooks);
  }

  void putHabit(Habit habit) {
    habit.user.target = userRepository.currentUser;
    store.box<Habit>().put(habit);
  }

  void removeHabit(Habit habit) {
    store.box<Habit>().remove(habit.id);
  }
}