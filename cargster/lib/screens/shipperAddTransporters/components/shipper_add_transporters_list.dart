import 'package:booking_sdk/models/cargster/DealsEntity.dart';
import 'package:booking_sdk/services/cargster/cargster_deals_firestore_service.dart';
import 'package:flutter/material.dart';

import './shipper_add_transporters_item.dart';

class ShipperAddTransportersList extends StatefulWidget {
  final String id;

  const ShipperAddTransportersList({Key key, this.id}) : super(key: key);
  @override
  _ShipperAddTransportersListState createState() =>
      _ShipperAddTransportersListState();
}

class _ShipperAddTransportersListState
    extends State<ShipperAddTransportersList> {
  @override
  Widget build(BuildContext context) {
    Stream<List<DealsEntity>> posts =
        DealsFirestoreService.getCurrentPostDeals(widget.id);
    return StreamBuilder(
        stream: posts,
        builder:
            (BuildContext context, AsyncSnapshot<List<DealsEntity>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            default:
              if (snapshot.data != null) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) =>
                      buildShipperAddTransportersItem(
                          context, snapshot.data[index]),
                );

              }
          }
          return CircularProgressIndicator();
        });
  }
}
