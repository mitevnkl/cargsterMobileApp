import 'package:booking_sdk/models/cargster/CargsterShipperPostEntity.dart';
import 'package:booking_sdk/providers/firebase_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../local/app_localizations.dart';
import '../../../main.dart';
import '../../../size_config.dart';

class CreatePrice extends StatefulWidget {
  String defaultValue;

  CreatePrice(this.defaultValue);

  @override
  _CreatePriceState createState() => _CreatePriceState();
}

class _CreatePriceState extends State<CreatePrice> {
  String price;
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
                              'assets/icons/money-time.svg',
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
                                  .translate('create_price'),
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
                              AppLocalizations.of(context).translate('skip'),
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
        Padding(
          child: TextFormField(
            keyboardType: TextInputType.name,
            // onSaved: (newValue) => name = newValue,
            initialValue: price ?? widget.defaultValue,
            onChanged: (value) {
              price = value;
              CargsterShipperPostEntity currentPost =
                  providerContainer.read(currentShipperPostProvider).state;
              currentPost.price = value;
              providerContainer.read(currentShipperPostProvider).state =
                  currentPost;
              return null;
            },
            validator: (value) {
              return null;
            },
            decoration: InputDecoration(
              hintText:
                  AppLocalizations.of(context).translate('amount_and_currency'),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
          padding: EdgeInsets.only(right: SizeConfig.screenWidth * 0.01),
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.022),
      ],
    );
  }
}
