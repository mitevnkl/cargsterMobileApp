import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import './create_date.dart';
import './create_dropoff.dart';
import './create_pickup.dart';
import './create_price.dart';
import './create_vehicle_type.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../local/app_localizations.dart';
import '../../../size_config.dart';
import 'package:intl/intl.dart' show DateFormat;

Widget createSettingItem(BuildContext context, createListData) {
  return new Container(
    child: InkWell(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(25),
            getProportionateScreenWidth(10),
            getProportionateScreenWidth(25),
            getProportionateScreenWidth(10)),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: getProportionateScreenHeight(80),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      getProportionateScreenWidth(20),
                      getProportionateScreenWidth(20),
                      getProportionateScreenWidth(0),
                      getProportionateScreenWidth(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset(
                          createListData['svg'],
                          color: kDarkGreyColor,
                          height: getProportionateScreenWidth(16),
                          width: getProportionateScreenWidth(16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: getProportionateScreenHeight(80),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        getProportionateScreenWidth(10),
                        getProportionateScreenWidth(20),
                        getProportionateScreenWidth(20),
                        getProportionateScreenWidth(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            createListData['defaultValue'].toString() != 'null'
                                ? (createListData['defaultValue'].runtimeType ==
                                        DateTime
                                    ? DateFormat('MM.dd.yyyy HH:mm')
                                        .format(createListData['defaultValue'])
                                        .toString()
                                    : createListData['defaultValue'].toString())
                                : AppLocalizations.of(context).translate(
                                    'create_${createListData['name']}'),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(16),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
                height: null,
                textBaseline: TextBaseline.ideographic,
                fontSize: 0,
                fontWeight: null,
                decorationThickness: 0,
                fontStyle: FontStyle.normal,
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
            content: Container(
              margin: EdgeInsets.only(top: getProportionateScreenHeight(15)),
              child: Column(
                children: [
                  (createListData['name'] == 'date')
                      ? CreateDate(createListData['defaultValue'])
                      : (createListData['name'] == 'pickup')
                          ? CreatePickup(createListData['defaultValue'])
                          : (createListData['name'] == 'dropoff')
                              ? CreateDropoff(createListData['defaultValue'])
                              : (createListData['name'] == 'vehicleType')
                                  ? CreateVehicleType(
                                      createListData['defaultValue'])
                                  : (createListData['name'] == 'price')
                                      ? CreatePrice(
                                          createListData['defaultValue'])
                                      : Container(),
                  DefaultButton(
                      text: "OK",
                      press: () {
                        Navigator.pop(context);
                      },
                      width: SizeConfig.screenWidth / 1.50,
                      height: getProportionateScreenWidth(45)),
                ],
              ),
            ),
            buttons: []).show();
      },
    ),
  );
}
