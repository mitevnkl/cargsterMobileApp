import 'package:cargster/routes.dart';
import 'package:cargster/screens/home/home_screen.dart';
import 'package:cargster/screens/shipperInviteTransporter/shipper_invite_transporter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './shipper_add_transporters_list.dart';
import '../../../constants.dart';
import '../../../local/app_localizations.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  final String id;

  const Body({Key key, this.id}) : super(key: key);

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
              Padding(
                  padding:
                      EdgeInsets.only(top: getProportionateScreenWidth(50)),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  AppLocalizations.of(context)
                                      .translate('share_with'),
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(20),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                InkWell(
                                    child: Container(
                                      padding: EdgeInsets.all(
                                          getProportionateScreenWidth(12)),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        border: Border.all(
                                            color: kPrimaryLightColor,
                                            width: 2.0),
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/icons/user-add.svg',
                                        color: kPrimaryColor,
                                        height: getProportionateScreenWidth(16),
                                        width: getProportionateScreenWidth(16),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context,
                                          ShipperInviteTransporterScreen
                                              .routeName,
                                          arguments: new ShipperPostArgs(
                                              id: widget.id));
                                      //TODO go to invite screen
                                    })
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              Container(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(
                        getProportionateScreenWidth(25),
                        getProportionateScreenWidth(25),
                        getProportionateScreenWidth(25),
                        getProportionateScreenWidth(0)),
                    padding: EdgeInsets.fromLTRB(
                        getProportionateScreenWidth(15),
                        getProportionateScreenWidth(0),
                        getProportionateScreenWidth(15),
                        getProportionateScreenWidth(0)),
                    decoration: BoxDecoration(
                      color: kBackgroundColor,
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: getProportionateScreenHeight(80),
                                      width: SizeConfig.screenWidth * 0.67,
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                          getProportionateScreenWidth(7),
                                          getProportionateScreenWidth(10),
                                          getProportionateScreenWidth(10),
                                          getProportionateScreenWidth(10),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Select all',
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        16),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: getProportionateScreenWidth(22),
                                  height: getProportionateScreenWidth(22),
                                  margin: EdgeInsets.only(
                                      right: getProportionateScreenWidth(3),
                                      left: getProportionateScreenWidth(15)),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        getProportionateScreenWidth(3)),
                                    border: Border.all(
                                        color: kLightGreyColor, width: 2.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        getProportionateScreenWidth(14)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(child: ShipperAddTransportersList(id: widget.id)),
            ],
          ),
        ),
        Positioned(
          left: SizeConfig.screenWidth / 2 - SizeConfig.screenWidth * 0.35,
          bottom: 50.0,
          child: InkWell(
              child: Container(
                child: Container(
                  width: SizeConfig.screenWidth * 0.7,
                  height: getProportionateScreenHeight(52),
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(4)),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        getProportionateScreenWidth(10),
                        getProportionateScreenWidth(12),
                        getProportionateScreenWidth(10),
                        getProportionateScreenWidth(12)),
                    child: Text('OK',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(20),
                            color: Colors.white)),
                  ),
                ),
              ),
              onTap: () async {
                print('OK');

                Navigator.pushNamed(context, HomeScreen.routeName);
              }),
        ),
      ],
    );
  }
}
