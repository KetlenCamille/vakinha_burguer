import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burguer_mobile/app/core/constants/constants.dart';

class AuthService extends GetxService {
  final _isLogged = RxnBool();
  final _getStored = GetStorage();

  Future<AuthService> init() async {
    _getStored.listenKey(Constants.USER_KEY, (value) {
      if (value != null) {
        _isLogged(true);
      } else {
        _isLogged(false);
      }
    });

    ever<bool?>(_isLogged, (isLogged) {
      if (isLogged == null || !isLogged) {
        Get.offAllNamed('/auth/login');
      } else {
        Get.offAllNamed('/home');
      }
    });

    _isLogged(getUserId() != null);
    return this;
  }

  void logout() => _getStored.write(Constants.USER_KEY, null);

  int? getUserId() => _getStored.read(Constants.USER_KEY);
}
