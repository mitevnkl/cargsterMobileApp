import 'package:booking_sdk/models/cargster/CargsterShipperPostEntity.dart';
import 'package:booking_sdk/models/cargster/CargsterUserEntity.dart';
import 'package:booking_sdk/providers/firebase_providers.dart';
import 'package:booking_sdk/res/cargster_constants.dart';
import 'package:cargster/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_helpers/firebase_helpers.dart';

import 'cargster_users_firestore_service.dart';

final cargsterShipperPostDBS = DatabaseService<CargsterShipperPostEntity>(
  CargsterConstants.shipperPostsCollection,
  fromDS: (id, data) => CargsterShipperPostEntity.fromDS(id, data),
  toMap: (entity) => entity.toMap(),
);

class ShipperPostsFirestoreService {
  static Stream<List<CargsterShipperPostEntity>> getCurrentUserPosts() {
    User currentUser = providerContainer.read(currentUserProvider).state;
    return cargsterShipperPostDBS.streamQueryList(args: [
      new QueryArgsV2(CargsterShipperPostEntity.USER_ID_FIELD_NAME,
          isEqualTo: currentUser.uid)
    ]);
  }

  static Future<DocumentReference> savePost(
      CargsterShipperPostEntity entity) async {
    CargsterUserEntity user = await CargsterUsersService.getUser();
    entity.userId = user.id;
    DocumentReference documentReference =
        await cargsterShipperPostDBS.create(entity.toMap(), id: entity.id);
    return documentReference;
  }

  static deletePost(CargsterShipperPostEntity entity) async {
    cargsterShipperPostDBS.removeItem(entity.id);
  }
}
