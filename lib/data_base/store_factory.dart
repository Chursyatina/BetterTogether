import 'package:path_provider/path_provider.dart';

import '../objectbox.g.dart';

class StoreFactory {
    Future<Store> getDBController() async {
        final dir = await getApplicationDocumentsDirectory();
        return Store(getObjectBoxModel(), directory: "${dir.path}/objectbox14");
    }
}