import 'package:bettertogether/stores/current_day_store.dart';
import 'package:bettertogether/stores/current_habit_sttore.dart';
import 'package:bettertogether/stores/current_task_store.dart';
import 'package:bettertogether/stores/habit_store.dart';
import 'package:bettertogether/stores/task_store.dart';
import 'package:bettertogether/stores/user_store.dart';
import 'package:get_it/get_it.dart';

import 'data_base/store_factory.dart';
import 'objectbox.g.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
getIt.registerSingletonAsync<Store>(() => StoreFactory().getDBController());

getIt.registerSingletonWithDependencies<UserRepository>(() => UserRepository(getIt<Store>()), dependsOn: [Store]);

getIt.registerSingletonWithDependencies<TaskRepository>(() => TaskRepository(getIt<Store>(), getIt<UserRepository>()), dependsOn: [Store, UserRepository]);

getIt.registerSingletonWithDependencies<HabitRepository>(() => HabitRepository(getIt<Store>(), getIt<UserRepository>()), dependsOn: [Store, UserRepository]);

getIt.registerSingletonWithDependencies<CurrentDayStore>(() => CurrentDayStore(getIt<TaskRepository>(), getIt<HabitRepository>()), dependsOn: [TaskRepository, HabitRepository]);

getIt.registerSingleton<CurrentTaskStore>(CurrentTaskStore());

getIt.registerSingleton<CurrentHabitStore>(CurrentHabitStore());
}
