import 'package:booking_sdk/models/cargster/CargsterShipperPostEntity.dart';
import 'package:booking_sdk/services/cargster/cargster_shipper_posts_firestore_service.dart';
import 'package:flutter/material.dart';

import 'home_item.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    Stream<List<CargsterShipperPostEntity>> posts =
        ShipperPostsFirestoreService.getCurrentUserPosts();
    return StreamBuilder(
        stream: posts,
        builder: (BuildContext context,
            AsyncSnapshot<List<CargsterShipperPostEntity>> snapshot) {
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
                      buildHomeItem(context, snapshot.data[index]),
                );

                return CircularProgressIndicator();
              }
          }
          return CircularProgressIndicator();
        });
  }
}
