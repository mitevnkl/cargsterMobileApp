import 'package:flutter/material.dart';
import './components/home_body.dart';
import '../../size_config.dart';
import '../../constants.dart';
import '../../components/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: HomeAppbar(),
        ),
        body: Container(
          child: Body(),
          height: SizeConfig.screenHeight,
        ));
  }
}
