import 'package:booking_sdk/models/cargster/CargsterUserEntity.dart';
import 'package:booking_sdk/models/cargster/DealsEntity.dart';
import 'package:booking_sdk/services/cargster/cargster_users_firestore_service.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildShipperAddTransportersItem(BuildContext context, DealsEntity deal) {
  Future<CargsterUserEntity> user = CargsterUsersService.getUserByDeal(deal);

  return FutureBuilder(
      future: user,
      builder:
          (BuildContext context, AsyncSnapshot<CargsterUserEntity> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          default:
            if (snapshot.data != null) {
              CargsterUserEntity userEntity = snapshot.data;
              return new Container(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.fromLTRB(
                        getProportionateScreenWidth(25),
                        getProportionateScreenWidth(10),
                        getProportionateScreenWidth(25),
                        getProportionateScreenWidth(10)),
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
                                            Container(
                                              margin: EdgeInsets.only(right: getProportionateScreenWidth(15)),
                                              width:
                                                  getProportionateScreenWidth(
                                                      30),
                                              height:
                                                  getProportionateScreenWidth(
                                                      30),
                                              child: CircleAvatar(
                                                  radius: 30,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child:
                                                        userEntity.image != null
                                                            ? Container()
                                                            : SvgPicture.asset(
                                                                "assets/icons/user.svg",
                                                                height:
                                                                    getProportionateScreenWidth(
                                                                        15),
                                                                width:
                                                                    getProportionateScreenWidth(
                                                                        15),
                                                              ),
                                                  ),
                                                  backgroundColor:
                                                      kLightestGreyColor,
                                                  backgroundImage:
                                                      userEntity.image != null
                                                          ? FileImage(
                                                              userEntity.image)
                                                          : null),
                                            ),
                                            Text(
                                              (userEntity.name.length > 17)
                                                  ? userEntity.name
                                                          .substring(0, 16) +
                                                      '... '
                                                  : userEntity.name + ' ',
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        16),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              userEntity.surname ?? '',
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
              );
            }
            return CircularProgressIndicator();
        }
      });
}
