import 'package:booking_sdk/res/cargster_constants.dart';
import 'package:booking_sdk/services/cargster/cargster_users_firestore_service.dart';
import 'package:cargster/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../components/custom_dropdown.dart';
import '../local/app_localizations.dart';

import '../size_config.dart';
import '../texts.dart';

class OnboardAppbar extends StatefulWidget {
  @override
  _OnboardAppbarState createState() => _OnboardAppbarState();
}

class _OnboardAppbarState extends State<OnboardAppbar> {
  String _lang = 'EN';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: new Container(),
      // toolbarHeight: getProportionateScreenHeight(50),
      flexibleSpace: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(getProportionateScreenHeight(45), 40.0,
            getProportionateScreenHeight(26), 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context).translate('onboard_header'),
                    style: headingStyle,
                  ),
                  CustomDropdown()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
