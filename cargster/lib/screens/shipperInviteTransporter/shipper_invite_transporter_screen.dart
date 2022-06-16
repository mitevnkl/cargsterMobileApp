import 'package:flutter/material.dart';

import './components/shipper_invite_transporter_body.dart';
import '../../size_config.dart';

class ShipperInviteTransporterScreen extends StatelessWidget {
  static String routeName = "/shipper-invite-transporter";
  final String id;

  const ShipperInviteTransporterScreen({Key key, this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Flexible(
            child: Body(id: id),
          ),
        ],
      ),
    );
  }
}
