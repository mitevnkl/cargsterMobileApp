import 'package:booking_sdk/models/cargster/CargsterShipperPostEntity.dart';
import 'package:booking_sdk/providers/firebase_providers.dart';
import 'package:booking_sdk/services/cargster/cargster_shipper_posts_firestore_service.dart';
import 'package:cargster/screens/create/create_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../constants.dart';
import '../../../main.dart';
import '../../../size_config.dart';
import '../../../local/app_localizations.dart';

Widget buildHomeItem(BuildContext context, CargsterShipperPostEntity post) {
  Color leftBorderColor = kPrimaryLightColor;
  if (post.adr == true) {
    leftBorderColor = kLightGreyColor;
  }
  final _slidableKey = GlobalKey<SlidableState>();

  return new Container(
    child: Slidable(
      key: _slidableKey,
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.20,
      child: InkWell(
        onTap: () {
          _slidableKey.currentState.open(
            actionType: SlideActionType.secondary,
          );
        },
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(
              getProportionateScreenWidth(25),
              getProportionateScreenWidth(10),
              getProportionateScreenWidth(25),
              getProportionateScreenWidth(10)),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: getProportionateScreenWidth(12),
                        height: getProportionateScreenHeight(120),
                        margin: EdgeInsets.only(
                            right: getProportionateScreenWidth(10)),
                        decoration: BoxDecoration(
                          color: leftBorderColor,
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(14)),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: getProportionateScreenHeight(120),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                getProportionateScreenWidth(7),
                                getProportionateScreenWidth(20),
                                getProportionateScreenWidth(20),
                                getProportionateScreenWidth(20),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    (post.pickUp.companyName.length > 17)
                                        ? post.pickUp.companyName
                                                .substring(0, 16) +
                                            '...'
                                        : post.pickUp.companyName,
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(16),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    post.dropOff.companyName ?? '',
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(16),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(120),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(10),
                          getProportionateScreenWidth(20),
                          getProportionateScreenWidth(20),
                          getProportionateScreenWidth(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              DateFormat('MM.dd.yyyy HH:mm')
                                  .format(post.date)
                                  .toString(),
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(16),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${post.price.toString()}" ?? '',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(16),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      secondaryActions: <Widget>[
        Container(
          width: getProportionateScreenWidth(0),
          height: getProportionateScreenHeight(140),
          decoration: BoxDecoration(
              // color: Colors.red,
              ),
          child: Padding(
              padding: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(0),
                getProportionateScreenWidth(10),
                getProportionateScreenWidth(20),
                getProportionateScreenWidth(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: InkWell(
                          onTap: () {
                            Alert(
                                style: AlertStyle(
                                  animationType: AnimationType.fromLeft,
                                  isCloseButton: false,
                                  // isOverlayTapDismiss: false,
                                  buttonAreaPadding: EdgeInsets.all(10.0),
                                  titleStyle: TextStyle(
                                    height: 0,
                                    fontSize: 0,
                                    textBaseline: null,
                                  ),
                                  alertPadding: EdgeInsets.all(0.0),
                                  descStyle: TextStyle(
                                    height: 0,
                                    fontSize: 0,
                                    textBaseline: null,
                                  ),
                                  overlayColor: Color(0x55000000),
                                  animationDuration:
                                      Duration(milliseconds: 100),
                                ),
                                context: context,
                                type: AlertType.none,
                                title: '',
                                content: Container(
                                  width: SizeConfig.screenWidth * 0.8,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical:
                                                      getProportionateScreenHeight(
                                                          25)),
                                              child: Text(
                                                  AppLocalizations.of(context)
                                                      .translate('delete'),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          getProportionateScreenHeight(
                                                              25))))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            width: SizeConfig.screenWidth * 0.7,
                                            padding: EdgeInsets.only(
                                                bottom:
                                                    getProportionateScreenHeight(
                                                        25)),
                                            child: Text(
                                              AppLocalizations.of(context)
                                                  .translate(
                                                      'postWillBeDeleted'),
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenHeight(
                                                        20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  ShipperPostsFirestoreService
                                                      .deletePost(post);
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      getProportionateScreenHeight(
                                                          55),
                                                      getProportionateScreenHeight(
                                                          12),
                                                      getProportionateScreenHeight(
                                                          55),
                                                      getProportionateScreenHeight(
                                                          12)),
                                                  decoration: BoxDecoration(
                                                    color: kRedColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Text(
                                                    AppLocalizations.of(context)
                                                        .translate('yes'),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          getProportionateScreenHeight(
                                                              22),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      getProportionateScreenHeight(
                                                          57),
                                                      getProportionateScreenHeight(
                                                          11),
                                                      getProportionateScreenHeight(
                                                          57),
                                                      getProportionateScreenHeight(
                                                          11)),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: kDarkGreyColor,
                                                        width:
                                                            getProportionateScreenHeight(
                                                                1),
                                                        style:
                                                            BorderStyle.solid),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Text(
                                                    AppLocalizations.of(context)
                                                        .translate('no'),
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          getProportionateScreenHeight(
                                                              22),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                buttons: []).show();
                          },
                          child: Padding(
                            padding:
                                EdgeInsets.all(getProportionateScreenWidth(15)),
                            child: SvgPicture.asset(
                              "assets/icons/bin.svg",
                              height: getProportionateScreenWidth(14),
                              width: getProportionateScreenWidth(14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: InkWell(
                          onTap: () {
                            // TODO Add special edit action
                            CargsterShipperPostEntity currentPost =
                                providerContainer
                                    .read(currentShipperPostProvider)
                                    .state;
                            currentPost = post;
                            providerContainer
                                .read(currentShipperPostProvider)
                                .state = currentPost;

                            Navigator.pushNamed(context, CreateScreen.routeName,
                                arguments: post);
                            print('edit item');
                          },
                          child: Padding(
                            padding:
                                EdgeInsets.all(getProportionateScreenWidth(15)),
                            child: SvgPicture.asset(
                              "assets/icons/cog.svg",
                              height: getProportionateScreenWidth(14),
                              width: getProportionateScreenWidth(14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ],
    ),
  );
}
