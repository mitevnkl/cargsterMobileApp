import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../size_config.dart';
import '../constants.dart';

class CustomDropdown extends StatefulWidget {
  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final List<String> textList = ["EN", "CRO"];
  String _currentItemSelected;

  @override
  void initState() {
    super.initState();
    _currentItemSelected = textList[0];
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (context) {
        return textList.map((str) {
          return PopupMenuItem(
            value: str,
            child: Text(str),
          );
        }).toList();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SvgPicture.asset(
            "assets/icons/arrow.svg",
            color: kTextColor,
            height: getProportionateScreenWidth(22),
            width: getProportionateScreenWidth(22),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
              _currentItemSelected,
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(22), color: kTextColor),
            ),
          ),
        ],
      ),
      onSelected: (v) {
        setState(() {
          print('!!!===== $v');
          _currentItemSelected = v;
        });
      },
    );
  }
}
