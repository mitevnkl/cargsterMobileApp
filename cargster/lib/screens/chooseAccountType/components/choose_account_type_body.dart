import 'package:booking_sdk/res/cargster_constants.dart';
import 'package:booking_sdk/services/cargster/cargster_users_firestore_service.dart';
import 'package:cargster/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';
import '../../../texts.dart';
import '../../../local/app_localizations.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(23.0),
                          child: Text(
                            AppLocalizations.of(context)
                                .translate('choose_text'),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: getProportionateScreenWidth(22),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                InkWell(
                  child: Container(
                      color: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(24.0, 24.0, 50.0, 24.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          AppLocalizations.of(context)
                                              .translate('shipper_title'),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                getProportionateScreenWidth(22),
                                            fontWeight: FontWeight.bold,
                                          )),
                                      SizedBox(
                                          height:
                                              SizeConfig.screenHeight * 0.008),
                                      Text(
                                          AppLocalizations.of(context)
                                              .translate('shipper_aim'),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                getProportionateScreenWidth(16),
                                            fontWeight: FontWeight.normal,
                                          )),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/box.svg",
                                        color: kPrimaryColor,
                                        height: getProportionateScreenWidth(30),
                                        width: getProportionateScreenWidth(30),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ))),
                  onTap: () {
                    CargsterUsersService.saveType(
                        type: CargsterConstants.shipper);
                    FocusScope.of(context).unfocus();
                  },
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                InkWell(
                  child: Container(
                      color: Colors.white,
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(24.0, 24.0, 50.0, 24.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          AppLocalizations.of(context)
                                              .translate('transporter_title'),
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                getProportionateScreenWidth(22),
                                            fontWeight: FontWeight.bold,
                                          )),
                                      SizedBox(
                                          height:
                                              SizeConfig.screenHeight * 0.008),
                                      Text(
                                          AppLocalizations.of(context)
                                              .translate('transporter_aim'),
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize:
                                                getProportionateScreenWidth(16),
                                            fontWeight: FontWeight.normal,
                                          )),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/truck.svg",
                                        color: kPrimaryColor,
                                        height: getProportionateScreenWidth(30),
                                        width: getProportionateScreenWidth(30),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ))),
                  onTap: () {
                    CargsterUsersService.saveType(
                        type: CargsterConstants.transporter);
                    FocusScope.of(context).unfocus();
                    CargsterUsersService.getUser()
                        .then((value) => print(value.toMap()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
