import 'package:booking_sdk/models/cargster/CargsterShipperPostEntity.dart';
import 'package:booking_sdk/providers/firebase_providers.dart';
import 'package:cargster/screens/create/create_screen.dart';
import 'package:flutter/material.dart';

import './home_list.dart';
import '../../../constants.dart';
import '../../../local/app_localizations.dart';
import '../../../main.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, right: 0.0, bottom: 0.0, top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              //TODO:
                              //place here 'contact joined' card
                              SizedBox(height: SizeConfig.screenHeight * 0.02),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(child: HomeList()),
            ],
          ),
        ),
        Positioned(
          left: SizeConfig.screenWidth / 2 - getProportionateScreenWidth(80),
          bottom: 50.0,
          child: InkWell(
              child: Container(
                child: Container(
                  width: getProportionateScreenWidth(160),
                  height: getProportionateScreenHeight(52),
                  decoration: BoxDecoration(
                      color: kPrimaryLightColor,
                      borderRadius: BorderRadius.circular(100)),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        getProportionateScreenWidth(10),
                        getProportionateScreenWidth(12),
                        getProportionateScreenWidth(10),
                        getProportionateScreenWidth(12)),
                    child: Text(AppLocalizations.of(context).translate('post'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(20),
                        )),
                  ),
                ),
              ),
              onTap: () async {
                // TODO get contacts from phone
                // Iterable<PhoneContactEntity> contacts =
                //     await PhoneCore.getContacts();
                // print(contacts.first.name);
                // print(contacts.first.phone);

                // TODO Send sms to bunch of people
                // PhoneCore.sendSms(
                //     [new PhoneContactEntity("VALERA", "+4531195059")],
                //     "Hi mister!");

                // Shipper posts.
                // TODO Create
                CargsterShipperPostEntity currentPost =
                    providerContainer.read(currentShipperPostProvider).state;
                currentPost = new CargsterShipperPostEntity();
                providerContainer.read(currentShipperPostProvider).state =
                    currentPost;
                Navigator.pushNamed(context, CreateScreen.routeName);
              }),
        ),
      ],
    );
  }
}
