import 'package:booking_sdk/models/cargster/CargsterShipperPostEntity.dart';
import 'package:booking_sdk/models/cargster/CargsterUserEntity.dart';
import 'package:booking_sdk/services/cargster/cargster_users_firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final verificationIdProvider = StateProvider<String>((ref) => '');
final contactNumberProvider = StateProvider<String>((ref) => '');
final smsOtpProvider = StateProvider<String>((ref) => '');

final firebaseAuthProvider = StateProvider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});
final currentUserProvider = StateProvider<User>((ref) {
  FirebaseAuth _auth = ref.watch(firebaseAuthProvider).state;
  // _auth.signOut();
  return _auth.currentUser;
});

final currentCargsterUserEntityProvider =
    StateProvider<Future<CargsterUserEntity>>((ref) async {
  User currentUser = ref.read(currentUserProvider).state;

  if (currentUser != null && !currentUser.isAnonymous) {
    CargsterUserEntity user = await cargsterUserDBS.getSingle(currentUser.uid);
    return user;
  } else {
    throw Exception('No current user');
  }
});

final currentShipperPostProvider = StateProvider<CargsterShipperPostEntity>(
    (ref) => new CargsterShipperPostEntity());
