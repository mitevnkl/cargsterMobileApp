import 'package:flutter/material.dart';
import './components/choose_account_type_body.dart';
import '../../size_config.dart';
import '../../texts.dart';
import '../../constants.dart';
import '../../components/onboard_appbar.dart';

class ChooseAccountTypeScreen extends StatelessWidget {
  static String routeName = "/choose-account-type";
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
