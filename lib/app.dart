import 'package:bettertogether/Core/theme.dart';
import 'package:bettertogether/Models/Task.dart';
import 'package:bettertogether/Models/User.dart';
import 'package:bettertogether/pages/Home/Screens/task.dart';
import 'package:bettertogether/pages/Home/home.dart';
import 'package:bettertogether/service_locator.dart';
import 'package:bettertogether/stores/current_day_store.dart';
import 'package:bettertogether/stores/current_habit_sttore.dart';
import 'package:bettertogether/stores/current_task_store.dart';
import 'package:bettertogether/stores/habit_store.dart';
import 'package:bettertogether/stores/task_store.dart';
import 'package:bettertogether/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    initFirebase();
    super.initState();
  }
  final UserRepository _userRepository = getIt<UserRepository>();
  final TaskRepository _taskRepository = getIt<TaskRepository>();
  final HabitRepository _habitRepository = getIt<HabitRepository>();
  final CurrentTaskStore _currentTaskStore = getIt<CurrentTaskStore>();
  final CurrentHabitStore _currentHabitStore = getIt<CurrentHabitStore>();
  final CurrentDayStore _currentDayStore = getIt<CurrentDayStore>();

  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserRepository>(create: (_) => _userRepository),
        Provider<TaskRepository>(create: (_) => _taskRepository),
        Provider<HabitRepository>(create: (_) => _habitRepository),
        Provider<CurrentTaskStore>(create: (_) => _currentTaskStore),
        Provider<CurrentHabitStore>(create: (_) => _currentHabitStore),
        Provider<CurrentDayStore>(create: (_) => _currentDayStore),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/single': (context) => TaskScreen(num: 0)
        },
      ),
    );
  }
}
