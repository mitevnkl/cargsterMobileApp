import 'package:flutter/material.dart';
import './components/introduce_body.dart';
import '../../size_config.dart';
import '../../texts.dart';
import '../../constants.dart';
import '../../components/onboard_appbar.dart';

class IntroduceScreen extends StatelessWidget {
  static String routeName = "/introduce";
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
