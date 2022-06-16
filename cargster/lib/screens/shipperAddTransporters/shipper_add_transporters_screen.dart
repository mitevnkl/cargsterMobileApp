import 'package:flutter/material.dart';

import './components/shipper_add_transporters_body.dart';
import '../../size_config.dart';

class ShipperAddTransportersScreen extends StatelessWidget {
  static String routeName = "/shipper-add-transporters";
  final String id;

  const ShipperAddTransportersScreen({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: SizeConfig.screenHeight,
        child: Body(id: id),
      ),
    );
  }
}
