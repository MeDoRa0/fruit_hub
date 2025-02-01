import 'dart:convert';

import 'package:fruit_hub/constant.dart';
import 'package:fruit_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub/features/authentication/data/models/user_model.dart';
import 'package:fruit_hub/features/authentication/domain/entites/user_entity.dart';

UserEntity getUser() {
  var jsonString = SharedPreferencesSingleton.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}
