import 'package:booking_sdk/models/cargster/CargsterShipperPostEntity.dart';
import 'package:booking_sdk/providers/firebase_providers.dart';
import 'package:booking_sdk/services/cargster/cargster_shipper_posts_firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './create_setting_item.dart';
import '../../../constants.dart';
import '../../../main.dart';
import '../../../size_config.dart';
import '../../../local/app_localizations.dart';

class CreateSettingsList extends StatefulWidget {
  CargsterShipperPostEntity entity;
  CreateSettingsList(this.entity);

  @override
  _CreateSettingsListState createState() => _CreateSettingsListState();
}

class _CreateSettingsListState extends State<CreateSettingsList> {
  @override
  Widget build(BuildContext context) {
    Stream<List<CargsterShipperPostEntity>> posts =
        ShipperPostsFirestoreService.getCurrentUserPosts();

    return Consumer(builder: (context, watch, child) {
      // if (widget.entity != null) {
      //   if (watch(currentShipperPostProvider).state.id == null) {
      //     watch(currentShipperPostProvider).state = widget.entity;
      //   }
      // }

      CargsterShipperPostEntity currentPost =
          watch(currentShipperPostProvider).state;
      List createListData = [
        {
          'id': '1',
          'name': 'date',
          'svg': 'assets/icons/calendar.svg',
          'defaultValue': currentPost.date
        },
        {
          'id': '2',
          'name': 'pickup',
          'svg': 'assets/icons/arrow-up.svg',
          'defaultValue': currentPost.pickUp
        },
        {
          'id': '3',
          'name': 'dropoff',
          'svg': 'assets/icons/arrow-down.svg',
          'defaultValue': currentPost.dropOff
        },
        {
          'id': '4',
          'name': 'vehicleType',
          'svg': 'assets/icons/truck.svg',
          'defaultValue': currentPost.vehicleType
        },
        {
          'id': '5',
          'name': 'price',
          'svg': 'assets/icons/money-time.svg',
          'defaultValue': currentPost.price
        }
      ];
      return Column(children: [
        StreamBuilder(
            stream: posts,
            builder: (BuildContext context,
                AsyncSnapshot<List<CargsterShipperPostEntity>> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                default:
                  if (snapshot.data != null && snapshot.data.length > 0) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                                child: Text(AppLocalizations.of(context).translate('suggestions'),
                                    style: TextStyle(
                                        color: kDarkGreyColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            getProportionateScreenHeight(20))),
                                padding: EdgeInsets.fromLTRB(
                                    getProportionateScreenHeight(28),
                                    0,
                                    0,
                                    getProportionateScreenHeight(15)))
                          ],
                        ),
                        Row(children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                getProportionateScreenHeight(28),
                                0,
                                0,
                                getProportionateScreenHeight(25)),
                            width: SizeConfig.screenWidth * 0.86,
                            height: getProportionateScreenHeight(80),
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data == null
                                  ? 0
                                  : snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  InkWell(
                                      child: Container(
                                        width: SizeConfig.screenWidth * 0.70,
                                        // height: getProportionateScreenHeight(80),
                                        margin: EdgeInsets.fromLTRB(
                                            0,
                                            getProportionateScreenHeight(5),
                                            getProportionateScreenHeight(15),
                                            getProportionateScreenHeight(9)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                getProportionateScreenHeight(
                                                    25),
                                                getProportionateScreenHeight(
                                                    12),
                                                getProportionateScreenHeight(
                                                    25),
                                                getProportionateScreenHeight(
                                                    12),
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    (snapshot.data[index]
                                                                .dropOff
                                                                .toString()
                                                                .length >
                                                            9)
                                                        ? snapshot.data[index]
                                                                .dropOff
                                                                .toString()
                                                                .substring(
                                                                    0, 8) +
                                                            '...'
                                                        : snapshot
                                                            .data[index].dropOff
                                                            .toString(),
                                                    style: TextStyle(
                                                      fontSize:
                                                          getProportionateScreenHeight(
                                                              20),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal:
                                                            getProportionateScreenWidth(
                                                                10)),
                                                    child: SvgPicture.asset(
                                                      'assets/icons/arrow-right.svg',
                                                      color: kDarkGreyColor,
                                                      height:
                                                          getProportionateScreenWidth(
                                                              12),
                                                      width:
                                                          getProportionateScreenWidth(
                                                              12),
                                                    ),
                                                  ),
                                                  Text(
                                                    (snapshot.data[index]
                                                                .dropOff
                                                                .toString()
                                                                .length >
                                                            9)
                                                        ? snapshot.data[index]
                                                                .dropOff
                                                                .toString()
                                                                .substring(
                                                                    0, 8) +
                                                            '...'
                                                        : snapshot
                                                            .data[index].dropOff
                                                            .toString(),
                                                    style: TextStyle(
                                                      fontSize:
                                                          getProportionateScreenHeight(
                                                              20),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        decoration:
                                            BoxDecoration(color: Colors.white),
                                      ),
                                      onTap: () {
                                        print(1);
                                        CargsterShipperPostEntity currentPost =
                                            providerContainer
                                                .read(
                                                    currentShipperPostProvider)
                                                .state;
                                        currentPost.merge(snapshot.data[index]);
                                        providerContainer
                                            .read(currentShipperPostProvider)
                                            .state = currentPost;
                                      }),
                            ),
                          )
                        ])
                      ],
                    );
                  } else {
                    return Container();
                  }
              }
              return CircularProgressIndicator();
            }),
        Row(children: [
          Padding(
              child: Text(AppLocalizations.of(context).translate('createNew'),
                  style: TextStyle(
                      color: kDarkGreyColor,
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenHeight(20))),
              padding: EdgeInsets.fromLTRB(getProportionateScreenHeight(28), 0,
                  0, getProportionateScreenHeight(10)))
        ]),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: createListData == null ? 0 : createListData.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) =>
              createSettingItem(context, createListData[index]),
        )
      ]);
    });
  }
}
