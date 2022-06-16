import 'dart:async';

import 'package:booking_sdk/models/cargster/CargsterUserEntity.dart';
import 'package:booking_sdk/providers/firebase_providers.dart';
import 'package:booking_sdk/services/cargster/cargster_users_firestore_service.dart';
import 'package:booking_sdk/services/firebase_otp_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../local/app_localizations.dart';
import '../../../size_config.dart';
import '../../../texts.dart';
import '../../introduce/introduce_screen.dart';
import '../../verification/verification_screen.dart';
import '../../home/home_screen.dart';

class VerificationForm extends StatefulWidget {
  @override
  _VerificationFormState createState() => _VerificationFormState();
}

class _VerificationFormState extends State<VerificationForm> {
  var onTapRecognizer;

  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  StreamController<ErrorAnimationType> errorController;

  bool hasError = false;
  String code = "";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final _formOTPKey = GlobalKey<FormState>();
  final List<String> errors = [];

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        // Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formOTPKey,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 6,
                  obscureText: false,
                  obscuringCharacter: '*',
                  animationType: AnimationType.fade,
                  validator: (v) {
                    // if (v.length < 3) {
                    //   return "I'm from validator";
                    // } else {
                    //   return null;
                    // }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 40,
                    fieldWidth: 40,
                    selectedColor: kPrimaryColor,
                    activeColor: kPrimaryColor,
                    selectedFillColor: Colors.white,
                    borderWidth: 2.0,
                    disabledColor: Colors.white,
                    inactiveColor: kInputColor,
                    inactiveFillColor: Colors.white,
                    activeFillColor: hasError ? Colors.white : Colors.white,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: Duration(milliseconds: 300),
                  textStyle: TextStyle(fontSize: 20, height: 1.6),

                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  boxShadows: [
                    // BoxShadow(
                    //   offset: Offset(0, 0),
                    //   color: kInputColor,
                    //   blurRadius: 2,
                    // )
                  ],
                  onCompleted: (v) {
                    print("Completed: " + v);
                  },
                  // onTap: () {
                  //   print("Pressed");
                  // },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      code = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print(AppLocalizations.of(context)
                            .translate('verification_accept_paste') +
                        " $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                )),
            FormError(errors: errors),
            SizedBox(height: SizeConfig.screenHeight * 0.008),
            DefaultButton(
                text:
                    AppLocalizations.of(context).translate('verification_btn'),
                press: () {
                  FocusScope.of(context).unfocus();
                  if (_formOTPKey.currentState.validate()) {
                    _formOTPKey.currentState.save();
                    if (code != '') {
                      FirebaseOtp.verifyOtp(code)
                          .then<CargsterUserEntity>((value) async {
                        return await CargsterUsersService.getUser();
                      }).then((CargsterUserEntity cargsterUser) {
                        if (cargsterUser.name.isNotEmpty) {
                          Navigator.pushNamed(context, HomeScreen.routeName);
                        } else {
                          Navigator.pushNamed(
                              context, IntroduceScreen.routeName);
                        }
                      }).catchError((e) {
                        print(e);
                        if (e.toString() ==
                            '[firebase_auth/session-expired] The sms code has expired. Please re-send the verification code to try again.') {
                          final snackBar = SnackBar(
                            padding: EdgeInsets.fromLTRB(20.0, 5.0, 10.0, 5.0),
                            content: Text(
                              AppLocalizations.of(context)
                                  .translate('verification_code_expired'),
                              style: TextStyle(fontSize: 15),
                            ),
                            backgroundColor: kRedColor,
                            duration: Duration(seconds: 4),
                            action: SnackBarAction(
                              textColor: Colors.white,
                              label: AppLocalizations.of(context)
                                  .translate('verification_code_resend'),
                              onPressed: () {
                                FirebaseOtp.verifyOtp(code)
                                    .then<CargsterUserEntity>((value) async {
                                  return await CargsterUsersService.getUser();
                                }).then((CargsterUserEntity cargsterUser) {
                                  if (cargsterUser.name.isNotEmpty) {
                                    Navigator.pushNamed(
                                        context, HomeScreen.routeName);
                                  } else {
                                    Navigator.pushNamed(
                                        context, IntroduceScreen.routeName);
                                  }
                                }).catchError((e) {});
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          final snackBar2 = SnackBar(
                            content: Text(AppLocalizations.of(context)
                                .translate('verification_code_wrong')),
                            backgroundColor: kRedColor,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar2);
                        }
                      });
                    } else {
                      print("validation error");
                    }
                  }
                }),
          ],
        ));
  }
}
