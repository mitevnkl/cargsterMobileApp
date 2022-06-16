import 'package:booking_sdk/models/cargster/CargsterShipperPostEntity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../local/app_localizations.dart';
import '../../../size_config.dart';
import 'create_vehicles_list.dart';

class CreateVehicleType extends StatefulWidget {
  CargsterShipperVehicleType vehicleChosenListDefault;

  CreateVehicleType(this.vehicleChosenListDefault);

  @override
  _CreateVehicleTypeState createState() => _CreateVehicleTypeState();
}

class _CreateVehicleTypeState extends State<CreateVehicleType> {
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(30),
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: getProportionateScreenWidth(0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/truck.svg',
                              color: kDarkGreyColor,
                              height: getProportionateScreenWidth(16),
                              width: getProportionateScreenWidth(16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: getProportionateScreenHeight(30),
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: getProportionateScreenWidth(0),
                          left: getProportionateScreenWidth(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              AppLocalizations.of(context)
                                  .translate('create_vehicleType'),
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
        CreateVehiclesList(widget.vehicleChosenListDefault),
        SizedBox(height: SizeConfig.screenHeight * 0.022),
      ],
    );
  }
}
