import 'package:booking_sdk/models/UserEntity.dart';
import 'package:firebase_helpers/firebase_helpers.dart';
import 'package:booking_sdk/res/data_constants.dart';

final userDBS = DatabaseService<UserEntity>(
  AppDBConstants.usersCollection,
  fromDS: (id, data) => UserEntity.fromDS(data),
  toMap: (user) => user.toMap(),
);
