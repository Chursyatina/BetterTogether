import 'package:get_it/get_it.dart';

import 'data_base/store_factory.dart';
import 'objectbox.g.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
getIt.registerSingletonAsync<Store>(() => StoreFactory().getDBController());
}
