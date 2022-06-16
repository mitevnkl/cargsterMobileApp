import 'package:booking_sdk/models/UserEntity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final analyticsProvider = Provider((ref) => FirebaseAnalytics());

final selectedUserProvider = StateProvider<UserEntity>((ref) => null);

/// Admin search field for users list.
final adminSearchStringProvider = StateProvider<String>((ref) => '');

/// Admin users list.
final listOfEntriesProvider = StreamProvider<List<UserEntity>>((ref) {
  String searchString = ref.watch(adminSearchStringProvider).state;

  return FirebaseFirestore.instance
      .collection('users')
      .where('email', isGreaterThanOrEqualTo: searchString)
      .where('email', isLessThan: searchString + 'z')
      .snapshots()
      .map((snapShot) => snapShot.docs
          .map((document) => UserEntity.fromDS(document.data()))
          .toList());
});

// final configProvider = Provider<AppConfig>((ref) => AppConfig(
//   appTitle: AppConstants.appName,
//   buildFlavor: AppFlavor.prod,
// ));
