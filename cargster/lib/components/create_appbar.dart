import 'package:booking_sdk/models/cargster/CargsterShipperPostEntity.dart';
import 'package:booking_sdk/providers/firebase_providers.dart';
import 'package:booking_sdk/services/cargster/cargster_shipper_posts_firestore_service.dart';
import 'package:cargster/constants.dart';
import 'package:cargster/routes.dart';
import 'package:cargster/screens/shipperAddTransporters/shipper_add_transporters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../local/app_localizations.dart';
import '../main.dart';
import '../screens/home/home_screen.dart';
import '../size_config.dart';
import 'default_button.dart';

class CreateAppbar extends StatefulWidget {
  @override
  _CreateAppbarState createState() => _CreateAppbarState();
}

class _CreateAppbarState extends State<CreateAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: new Container(),
      flexibleSpace: Container(
        color: kBackgroundColor,
        padding: EdgeInsets.fromLTRB(getProportionateScreenHeight(30), 40.0,
            getProportionateScreenHeight(30), 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.all(getProportionateScreenWidth(12)),
                          child: SvgPicture.asset(
                            "assets/icons/arrow-left.svg",
                            height: getProportionateScreenWidth(14),
                            width: getProportionateScreenWidth(14),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      }),
                  DefaultButton(
                      text: AppLocalizations.of(context).translate('post'),
                      press: () {
                        CargsterShipperPostEntity currentPost =
                            providerContainer
                                .read(currentShipperPostProvider)
                                .state;

                        ShipperPostsFirestoreService.savePost(currentPost)
                            .then((document) {
                          Navigator.pushNamed(
                              context, ShipperAddTransportersScreen.routeName,
                              arguments: new ShipperPostArgs(
                                  id: document != null
                                      ? document.id
                                      : currentPost.id));
                        });

                        //TODO make post creation
                        print('create');
                      },
                      width: getProportionateScreenWidth(80),
                      height: getProportionateScreenWidth(40)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
