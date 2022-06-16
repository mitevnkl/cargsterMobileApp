import 'package:booking_sdk/models/cargster/CargsterShipperPostEntity.dart';
import 'package:flutter/material.dart';

import './create_settings_list.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  CargsterShipperPostEntity entity;
  Body(this.entity);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: SizeConfig.screenHeight * 0.01),
          CreateSettingsList(widget.entity),
        ],
      ),
    );
  }
}
