import 'package:booking_sdk/models/cargster/DealsEntity.dart';
import 'package:booking_sdk/res/cargster_constants.dart';
import 'package:firebase_helpers/firebase_helpers.dart';

final cargsterDealsDBS = DatabaseService<DealsEntity>(
  CargsterConstants.dealsCollection,
  fromDS: (id, data) => DealsEntity.fromDS(id, data),
  toMap: (entity) => entity.toMap(),
);

class DealsFirestoreService {
  static Stream<List<DealsEntity>> getCurrentPostDeals(String postId) {
    // User currentUser = providerContainer.read(currentUserProvider).state;
    return cargsterDealsDBS.streamQueryList(args: [
      new QueryArgsV2(DealsEntity.POST_ID_FIELD_NAME, isEqualTo: postId)
    ]);
  }
}
