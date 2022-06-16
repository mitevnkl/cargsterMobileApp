import 'package:flutter/material.dart';
import 'size_config.dart';

//colors
const kPrimaryColor = Color(0xFF1AAE9F);
const kPrimaryLightColor = Color(0xFF8DD7CF);
const kBackgroundColor = Color(0xFFEEF0F1);

const kRedColor = Color(0xFFD2465C);
const kDarkGreyColor = Color(0xFF4B5C6B);
const kLightGreyColor = Color(0xFFC2CCD4);
const kLightestGreyColor = Color(0xFFDFE6ED);

const kTextColor = Color(0xFF293845);
const kInputColor = Color(0xFFC5CED6);

//texts
final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(30),
  color: kTextColor,
  fontWeight: FontWeight.bold,
);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
const String kNameNullError = "Please Enter your name";
const String kSurnameNullError = "Please Enter your surname";
const String kCompanyNameNullError = "Please Enter your company name";
const String kHeadquartersNullError = "Please Enter your headquarters";
const String kOtpCodeError = "Your code is not valid";

//Firebase errors
// TODO place firebase errors here
// const String kFirebaseNoEmailError =
//     "The email address or password is incorrect. Please retry...";

//other
const defaultDuration = Duration(milliseconds: 200);

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
