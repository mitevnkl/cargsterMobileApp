import 'package:firebase_helpers/firebase_helpers.dart';
import 'package:booking_sdk/res/data_constants.dart';
import 'package:booking_sdk/models/AppEvent.dart';

final eventDBS = DatabaseService<AppEvent>(
  AppDBConstants.eventsCollection,
  fromDS: (id, data) => AppEvent.fromDS(id, data),
  toMap: (event) => event.toMap(),
);
