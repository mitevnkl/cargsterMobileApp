import 'package:booking_sdk/providers/firebase_providers.dart';
import 'package:booking_sdk/services/firebase_otp_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../texts.dart';
import '../../verification/verification_screen.dart';
import '../../../local/app_localizations.dart';
import 'package:booking_sdk/models/cargster/CargsterShipperPostEntity.dart';
import 'package:booking_sdk/services/cargster/cargster_shipper_posts_firestore_service.dart';
import 'package:booking_sdk/providers/firebase_providers.dart';
import '../../../main.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String phoneNumber;
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
                      AppLocalizations.of(context).translate('welcome_text'),
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
                      child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.phone,
                                onSaved: (newValue) {
                                  verification_number = newValue;
                                  phoneNumber = newValue;
                                },
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    removeError(error: kPhoneNumberNullError);
                                  }
                                  return null;
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    addError(error: kPhoneNumberNullError);
                                    return "";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)
                                      .translate('mobile_hint'),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                ),
                              ),
                              FormError(errors: errors),
                              SizedBox(height: SizeConfig.screenHeight * 0.03),
                              DefaultButton(
                                  text: AppLocalizations.of(context)
                                      .translate('welcome_btn'),
                                  press: () {
                                    FocusScope.of(context).unfocus();
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      if (phoneNumber != null) {
                                        try {
                                          context
                                              .read(contactNumberProvider)
                                              .state = phoneNumber;
                                          FirebaseOtp.generateOtp(phoneNumber);
                                          Navigator.pushNamed(context,
                                              VerificationScreen.routeName);
                                        } catch (exception) {
                                          // handle
                                        }
                                      } else {
                                        print("validation error");
                                      }
                                    }
                                  }),
                            ],
                          )),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
