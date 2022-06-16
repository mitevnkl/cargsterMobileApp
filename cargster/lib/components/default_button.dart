import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
    this.width,
    this.height,
  }) : super(key: key);
  final String text;
  final Function press;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width != null ? width : double.infinity,
      height: height != null ? height : getProportionateScreenHeight(55),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(0.0),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
            )),
        onPressed: press,
        child: Ink(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
