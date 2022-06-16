import 'package:flutter/material.dart';

import './components/welcome_body.dart';
import '../../components/onboard_appbar.dart';
import '../../size_config.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName = "/welcome";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: OnboardAppbar(),
      ),
      body: Body(),
    );
  }
}
