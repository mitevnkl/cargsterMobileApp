import 'package:booking_sdk/models/cargster/CargsterShipperPostEntity.dart';
import 'package:booking_sdk/providers/firebase_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import './create_customs.dart';
import './google_places_field.dart';
import '../../../constants.dart';
import '../../../local/app_localizations.dart';
import '../../../main.dart';
import '../../../size_config.dart';

class CreatePickup extends StatefulWidget {
  CargsterShipperAddressEntity defaultValue;

  CreatePickup(this.defaultValue);

  @override
  _CreatePickupState createState() => _CreatePickupState();
}

class _CreatePickupState extends State<CreatePickup> {
  String company;
  String city;
  String address;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: getProportionateScreenHeight(44),
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: getProportionateScreenWidth(13),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/arrow-up.svg',
                              color: kDarkGreyColor,
                              height: getProportionateScreenWidth(16),
                              width: getProportionateScreenWidth(16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: getProportionateScreenHeight(44),
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: getProportionateScreenWidth(13),
                          left: getProportionateScreenWidth(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              AppLocalizations.of(context)
                                  .translate('create_pickup'),
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(18),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    child: Container(
                      height: getProportionateScreenHeight(44),
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: getProportionateScreenWidth(13),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context).translate('close'),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(18),
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    }),
              ],
            )
          ],
        ),
        TextFormField(
          keyboardType: TextInputType.name,
          initialValue: widget.defaultValue.companyName,
          // onSaved: (newValue) => name = newValue,
          onChanged: (value) {
            CargsterShipperPostEntity currentPost =
                providerContainer.read(currentShipperPostProvider).state;
            currentPost.pickUp.companyName = value;
            providerContainer.read(currentShipperPostProvider).state =
                currentPost;
            return null;
          },
          validator: (value) {
            return null;
          },
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context).translate('company_hint'),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
        GooglePlacesField(
            widget.defaultValue.id, widget.defaultValue.placeDescription,
            type: 'pickUp'),
        TextFormField(
          keyboardType: TextInputType.name,
          initialValue: widget.defaultValue.address,
          // onSaved: (newValue) => name = newValue,
          onChanged: (value) {
            CargsterShipperPostEntity currentPost =
                providerContainer.read(currentShipperPostProvider).state;
            currentPost.pickUp.address = value;
            providerContainer.read(currentShipperPostProvider).state =
                currentPost;
            return null;
          },
          validator: (value) {
            return null;
          },
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context).translate('address_hint'),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.022),
        InkWell(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(right: SizeConfig.screenWidth * 0.02),
                    child: SvgPicture.asset(
                      "assets/icons/customs.svg",
                      color: kTextColor,
                      height: getProportionateScreenWidth(18),
                      width: getProportionateScreenWidth(18),
                    ),
                  ),
                  Text('Add customs',
                      style: TextStyle(
                          color: kTextColor,
                          fontSize: getProportionateScreenWidth(20))),
                ],
              ),
              padding: EdgeInsets.all(SizeConfig.screenWidth * 0.025),
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: kLightGreyColor),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onTap: () {
              return Alert(
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
                    animationDuration: Duration(milliseconds: 100),
                  ),
                  context: context,
                  type: AlertType.none,
                  title: '',
                  content: Column(
                    children: [
                      CreateCustoms(widget.defaultValue, type: 'pickUp')
                    ],
                  ),
                  buttons: []).show();
            }),
        SizedBox(height: SizeConfig.screenHeight * 0.03),
      ],
    );
  }
}
