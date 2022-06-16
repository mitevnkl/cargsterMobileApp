import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../../texts.dart';
import '../components/verification_form.dart';
import '../../../local/app_localizations.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String code;
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(23.0),
                    child: Text(
                      AppLocalizations.of(context)
                              .translate('verification_text') +
                          verification_number +
                          '.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: getProportionateScreenWidth(22),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(24.0),
                      child: VerificationForm(),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
