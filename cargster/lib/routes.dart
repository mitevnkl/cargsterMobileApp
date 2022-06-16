import 'package:booking_sdk/models/cargster/CargsterShipperPostEntity.dart';
import 'package:cargster/screens/chooseAccountType/choose_account_type_screen.dart';
import 'package:cargster/screens/shipperAddTransporters/shipper_add_transporters_screen.dart';
import 'package:cargster/screens/shipperInviteTransporter/shipper_invite_transporter_screen.dart';
import 'package:flutter/widgets.dart';

import './screens/chooseAccountType/choose_account_type_screen.dart';
import './screens/create/create_screen.dart';
import './screens/home/home_screen.dart';
import './screens/introduce/introduce_screen.dart';
import './screens/verification/verification_screen.dart';
import './screens/welcome/welcome_screen.dart';

class ShipperPostArgs {
  final String id;

  ShipperPostArgs({this.id});
}

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  VerificationScreen.routeName: (context) => VerificationScreen(),
  IntroduceScreen.routeName: (context) => IntroduceScreen(),
  ChooseAccountTypeScreen.routeName: (context) => ChooseAccountTypeScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  CreateScreen.routeName: (context) {
    // TODO Create

    CargsterShipperPostEntity args = ModalRoute.of(context).settings.arguments;
    return CreateScreen(args);
  },
  ShipperAddTransportersScreen.routeName: (context) {
    ShipperPostArgs args = ModalRoute.of(context).settings.arguments;
    return ShipperAddTransportersScreen(id: args.id);
  },
  ShipperInviteTransporterScreen.routeName: (context) {
    ShipperPostArgs args = ModalRoute.of(context).settings.arguments;
    return ShipperInviteTransporterScreen(id: args.id);
  },
};
