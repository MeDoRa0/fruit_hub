import 'dart:convert';

import 'package:fruit_hub/constant.dart';
import 'package:fruit_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub/features/authentication/data/models/user_model.dart';
import 'package:fruit_hub/features/authentication/domain/entites/user_entity.dart';

UserEntity getUser() {
  var jsonString = SharedPreferencesSingleton.getString(kUserData);

  // Check if the string is empty, null, or doesn't exist
  if (jsonString.isEmpty) {
    // Return a default user entity or throw an exception
    throw Exception('User data not found. Please log in again.');
  }

  try {
    var userEntity = UserModel.fromJson(jsonDecode(jsonString));
    return userEntity;
  } catch (e) {
    // Handle JSON decode errors
    throw Exception('Invalid user data. Please log in again.');
  }
}
