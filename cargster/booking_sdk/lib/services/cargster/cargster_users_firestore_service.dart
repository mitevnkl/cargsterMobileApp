import 'package:booking_sdk/models/cargster/CargsterUserEntity.dart';
import 'package:booking_sdk/models/cargster/DealsEntity.dart';
import 'package:booking_sdk/providers/firebase_providers.dart';
import 'package:booking_sdk/res/data_constants.dart';
import 'package:cargster/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_helpers/firebase_helpers.dart';

final cargsterUserDBS = DatabaseService<CargsterUserEntity>(
  AppDBConstants.usersCollection,
  fromDS: (id, data) => CargsterUserEntity.fromDS(id, data),
  toMap: (user) => user.toMap(),
);

class CargsterUsersService {
  static Future<CargsterUserEntity> getUser() async {
    User currentUser = providerContainer.read(currentUserProvider).state;
    try {
      if (currentUser != null && !currentUser.isAnonymous) {
        CargsterUserEntity user =
            await cargsterUserDBS.getSingle(currentUser.uid);

        if (user == null) {
          throw Exception('No current user in dbs');
        }

        return user;
      } else {
        throw Exception('No current user');
      }
    } catch (e) {
      CargsterUsersService.signOut();
    }
  }

  static signOut() {
    FirebaseAuth _auth = providerContainer.read(firebaseAuthProvider).state;
    _auth.signOut();
  }

  static Future<CargsterUserEntity> getUserByDeal(
      DealsEntity dealsEntity) async {
    return await cargsterUserDBS.getSingle(dealsEntity.transporterId);
  }

  static saveInitialData(
      {String headquarters,
      String companyName,
      String surname,
      String name}) async {
    User currentUser = providerContainer.read(currentUserProvider).state;

    if (!currentUser.isAnonymous) {
      cargsterUserDBS.create({
        'headquarters': headquarters,
        'companyName': companyName,
        'surname': surname,
        'name': name,
      }, id: currentUser.uid);
    } else {
      throw Exception('No current user');
    }
  }

  static void saveType({String type}) {
    User currentUser = providerContainer.read(currentUserProvider).state;

    if (!currentUser.isAnonymous) {
      cargsterUserDBS.updateData(currentUser.uid, {
        'type': type.toString(),
      });
    } else {
      throw Exception('No current user');
    }
  }
}
