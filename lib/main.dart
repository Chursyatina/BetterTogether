// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, unnecessary_new
import 'package:bettertogether/app.dart';
import 'package:bettertogether/pages/Home/home.dart';
import 'package:bettertogether/service_locator.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:bettertogether/Core/theme.dart';
import 'package:bettertogether/pages/Home/Screens/day.dart';
import 'package:bettertogether/pages/Home/Screens/profile.dart';

import 'objectbox.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await setupLocator();
  await getIt.allReady();

  runApp(CalendarControllerProvider(
    controller:  EventController(),
    child: const App()
  ),);
}
