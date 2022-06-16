import 'package:booking_sdk/models/cargster/CargsterShipperPostEntity.dart';
import 'package:booking_sdk/providers/firebase_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../main.dart';
import '../../../size_config.dart';
import 'dart:convert';

class CreateVehiclesList extends StatefulWidget {
  CargsterShipperVehicleType vehicleChosenListDefault;

  CreateVehiclesList(this.vehicleChosenListDefault);

  @override
  _CreateVehiclesListState createState() => _CreateVehiclesListState();
}

class _CreateVehiclesListState extends State<CreateVehiclesList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    print(widget.vehicleChosenListDefault.vehicleType);
    Map<String, bool> vehicleChosenList =
        // widget
        //             .vehicleChosenListDefault.vehicleType !=
        //         null
        //     ? new Map<String, bool>.from(
        //         json.decode(widget.vehicleChosenListDefault.vehicleType.toString()))
        widget.vehicleChosenListDefault.vehicleType ??
            {
              'Tautliner': false,
              'Jumbo': false,
              'Mega': false,
              'Reefer': false,
              'ADR': false,
            };

    return Container(
      width: SizeConfig.screenWidth * 0.75,
      height: SizeConfig.screenHeight * 0.50,
      child: ListView(
          children: vehicleChosenList.keys.map((String key) {
        return Container(
          child: InkWell(
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  0,
                  getProportionateScreenHeight(5),
                  getProportionateScreenHeight(0),
                  getProportionateScreenHeight(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: getProportionateScreenWidth(20),
                    height: getProportionateScreenWidth(20),
                    margin: EdgeInsets.fromLTRB(
                      getProportionateScreenHeight(25),
                      getProportionateScreenHeight(20),
                      getProportionateScreenHeight(0),
                      getProportionateScreenHeight(20),
                    ),
                    decoration: BoxDecoration(
                      color: vehicleChosenList[key] == true
                          ? kPrimaryLightColor
                          : Colors.white,
                    ),
                    child: vehicleChosenList[key] == true
                        ? SvgPicture.asset(
                            'assets/icons/tick.svg',
                            color: Colors.white,
                            height: getProportionateScreenWidth(14),
                            width: getProportionateScreenWidth(14),
                          )
                        : Container(),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                        getProportionateScreenHeight(25),
                        getProportionateScreenHeight(20),
                        getProportionateScreenHeight(25),
                        getProportionateScreenHeight(20),
                      ),
                      child: Text(
                        key,
                      )),
                ],
              ),
              decoration: BoxDecoration(
                color: vehicleChosenList[key] == true
                    ? kPrimaryLightColor
                    : kBackgroundColor,
              ),
            ),
            onTap: () {
              setState(() {
                vehicleChosenList[key] = !vehicleChosenList[key];
              });
              CargsterShipperPostEntity currentPost =
                  providerContainer.read(currentShipperPostProvider).state;
              currentPost.vehicleType = new CargsterShipperVehicleType(
                  vehicleType: vehicleChosenList);
              providerContainer.read(currentShipperPostProvider).state =
                  currentPost;
              setState(() {
                widget.vehicleChosenListDefault = currentPost.vehicleType;
              });
            },
          ),
        );
      }).toList()),
    );
  }
}
