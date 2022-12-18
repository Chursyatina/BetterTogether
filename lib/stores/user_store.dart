import 'package:bettertogether/Models/User.dart';
import 'package:mobx/mobx.dart';
import 'package:bettertogether/objectbox.g.dart' as box;
part 'user_store.g.dart';

class UserRepository = _UserRepositoryBase with _$UserRepository;

abstract class _UserRepositoryBase with Store {
  final box.Store store;
  late User currentUser;

  _UserRepositoryBase(this.store) {
    final userBox = store.box<User>();

    final temp = userBox.getAll();
    if (temp.isEmpty) {
      currentUser = User();
      currentUser.id = userBox.put(currentUser);
    } else {
      currentUser = temp.first;
    }
  }
}
