import 'package:booking_sdk/services/cargster/cargster_users_firestore_service.dart';
import 'package:cargster/screens/chooseAccountType/choose_account_type_screen.dart';
import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../texts.dart';
import '../../../local/app_localizations.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name;
  String surname;
  String companyName;
  String headquarters;

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
                      padding: EdgeInsets.all(24.0),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)
                                    .translate('introduce_text'),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: getProportionateScreenWidth(22),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: SizeConfig.screenHeight * 0.03),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      child: TextFormField(
                                        keyboardType: TextInputType.name,
                                        onSaved: (newValue) => name = newValue,
                                        onChanged: (value) {
                                          if (value.isNotEmpty) {
                                            removeError(error: kNameNullError);
                                          }
                                          return null;
                                        },
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            addError(error: kNameNullError);
                                            return "";
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: AppLocalizations.of(context)
                                              .translate('name_hint'),
                                          floatingLabelBehavior:
                                              FloatingLabelBehavior.never,
                                        ),
                                      ),
                                      padding: EdgeInsets.only(
                                          right: SizeConfig.screenWidth * 0.01),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          onSaved: (newValue) =>
                                              surname = newValue,
                                          onChanged: (value) {
                                            if (value.isNotEmpty) {
                                              removeError(
                                                  error: kSurnameNullError);
                                            }
                                            return null;
                                          },
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              addError(
                                                  error: kSurnameNullError);
                                              return "";
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            hintText:
                                                AppLocalizations.of(context)
                                                    .translate('surname_hint'),
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                          ),
                                        ),
                                        padding: EdgeInsets.only(
                                            left:
                                                SizeConfig.screenWidth * 0.01)),
                                  )
                                ],
                              ),
                              SizedBox(height: SizeConfig.screenHeight * 0.02),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                onSaved: (newValue) => companyName = newValue,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    removeError(error: kCompanyNameNullError);
                                  }
                                  return null;
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    addError(error: kCompanyNameNullError);
                                    return "";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)
                                      .translate('company_name_hint'),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                ),
                              ),
                              SizedBox(height: SizeConfig.screenHeight * 0.02),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                onSaved: (newValue) => headquarters = newValue,
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    removeError(error: kHeadquartersNullError);
                                  }
                                  return null;
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    addError(error: kHeadquartersNullError);
                                    return "";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: AppLocalizations.of(context)
                                      .translate('headquarters_hint'),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                ),
                              ),
                              FormError(errors: errors),
                              SizedBox(height: SizeConfig.screenHeight * 0.03),
                              DefaultButton(
                                  text: AppLocalizations.of(context)
                                      .translate('introduce_btn'),
                                  press: () {
                                    FocusScope.of(context).unfocus();
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      if (companyName != null) {
                                        CargsterUsersService.saveInitialData(
                                            name: name,
                                            surname: surname,
                                            companyName: companyName,
                                            headquarters: headquarters);
                                        Navigator.pushNamed(context,
                                            ChooseAccountTypeScreen.routeName);
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
