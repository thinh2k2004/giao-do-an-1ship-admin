import 'package:base_getx/presenters/constants/constants.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseRemoteConfigService {
  static final _firebaseRemoteConfig = FirebaseRemoteConfig.instance;

  static String getConfigName() {
    final result = _firebaseRemoteConfig.getString(FirebaseKeys.HOME_CONFIG);
    // Model.fromJson(json.decode(result));
    return result;
  }
}
