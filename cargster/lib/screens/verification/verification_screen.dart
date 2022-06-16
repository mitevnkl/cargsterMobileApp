import 'package:flutter/material.dart';
import './components/verification_body.dart';
import '../../size_config.dart';
import '../../texts.dart';
import '../../constants.dart';
import '../../components/onboard_appbar.dart';

class VerificationScreen extends StatelessWidget {
  static String routeName = "/verification";
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
