import 'package:booking_sdk/models/cargster/CargsterShipperPostEntity.dart';
import 'package:booking_sdk/providers/firebase_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './google_places_field.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../local/app_localizations.dart';
import '../../../main.dart';
import '../../../size_config.dart';

class CreateCustoms extends StatefulWidget {
  CargsterShipperAddressEntity defaultValue;
  CreateCustoms(this.defaultValue, {Key key, this.type}) : super(key: key);

  final String type;

  @override
  _CreateCustomsState createState() => _CreateCustomsState();
}

class _CreateCustomsState extends State<CreateCustoms> {
  // final _controller = TextEditingController();

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
                                'assets/icons/customs.svg',
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
                                    .translate('create_customs'),
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
          SizedBox(height: SizeConfig.screenHeight * 0.022),
          TextFormField(
            initialValue: widget.defaultValue.customs,
            onChanged: (value) {
              if (widget.type == 'pickUp') {
                CargsterShipperPostEntity currentPost =
                    providerContainer.read(currentShipperPostProvider).state;
                currentPost.pickUp.customs = value;
                providerContainer.read(currentShipperPostProvider).state =
                    currentPost;
              }
              ;
              if (widget.type == 'dropOff') {
                CargsterShipperPostEntity currentPost =
                    providerContainer.read(currentShipperPostProvider).state;
                currentPost.dropOff.customs = value;
                providerContainer.read(currentShipperPostProvider).state =
                    currentPost;
              }
            },
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context).translate('spedition'),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
          GooglePlacesField(widget.defaultValue.customsId,
              widget.defaultValue.customsPlaceDescription,
              type:
                  widget.type == 'pickUp' ? 'pickUpCustoms' : 'dropOffCustoms'),
          SizedBox(height: SizeConfig.screenHeight * 0.005),
          DefaultButton(
              text: "OK",
              press: () {
                Navigator.pop(context);
              },
              width: SizeConfig.screenWidth / 1.50,
              height: getProportionateScreenWidth(45)),
        ],
      ),
    );
  }
}
