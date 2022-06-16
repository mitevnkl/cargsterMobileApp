import 'package:booking_sdk/models/PhoneContactEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

Widget buildShipperInviteTransportersItem(
    BuildContext context,
    PhoneContactEntity phoneContactEntity,
    List<PhoneContactEntity> selectedPhoneContacts,
    setState) {
  final _slidableKey = GlobalKey<SlidableState>();

  return new Container(
    child: InkWell(
      onTap: () {
        setState(() {
          selectedPhoneContacts.add(phoneContactEntity);
        });
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
                    Container(
                      width: getProportionateScreenWidth(16),
                      height: getProportionateScreenWidth(16),
                      margin: EdgeInsets.only(
                          right: getProportionateScreenWidth(3),
                          left: getProportionateScreenWidth(15)),
                      decoration: BoxDecoration(
                        color:
                            selectedPhoneContacts.contains(phoneContactEntity)
                                ? kPrimaryColor
                                : Colors.white,
                        borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(3)),
                        border:
                            selectedPhoneContacts.contains(phoneContactEntity)
                                ? Border.all(color: kPrimaryColor, width: 0)
                                : Border.all(color: kLightGreyColor, width: 2.0)
                      ),
                      child: selectedPhoneContacts.contains(phoneContactEntity)
                                ? SvgPicture.asset(
                            'assets/icons/tick.svg',
                            color: Colors.white,
                            height: getProportionateScreenWidth(16),
                            width: getProportionateScreenWidth(16),
                          ) : Container()
                                ,
                        padding:
                            EdgeInsets.all(getProportionateScreenWidth(0)),
                      ),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: getProportionateScreenHeight(80),
                          width: SizeConfig.screenWidth * 0.76,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(
                              getProportionateScreenWidth(7),
                              getProportionateScreenWidth(10),
                              getProportionateScreenWidth(10),
                              getProportionateScreenWidth(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  (phoneContactEntity.name.length > 17)
                                      ? phoneContactEntity.name
                                              .substring(0, 16) +
                                          '...'
                                      : phoneContactEntity.name,
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(16),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  phoneContactEntity.phone ?? '',
                                  style: TextStyle(
                                      fontSize: getProportionateScreenWidth(14),
                                      fontWeight: FontWeight.bold,
                                      color: kDarkGreyColor),
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
          ],
        ),
      ),
    ),
  );
}
