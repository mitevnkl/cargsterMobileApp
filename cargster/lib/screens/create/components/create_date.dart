import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './create_calendar.dart';
import './create_time.dart';
import '../../../size_config.dart';

class CreateDate extends StatefulWidget {
  DateTime defaultValue;

  CreateDate(this.defaultValue);

  @override
  _CreateDateState createState() => _CreateDateState();
}

class _CreateDateState extends State<CreateDate> {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CreateCalendar(widget.defaultValue),
        CreateTime(widget.defaultValue),
        SizedBox(height: SizeConfig.screenHeight * 0.03),
      ],
    );
  }
}
