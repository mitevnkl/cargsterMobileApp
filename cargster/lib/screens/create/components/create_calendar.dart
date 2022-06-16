import 'package:booking_sdk/models/cargster/CargsterShipperPostEntity.dart';
import 'package:booking_sdk/providers/firebase_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../../constants.dart';
import '../../../local/app_localizations.dart';
import '../../../main.dart';
import '../../../size_config.dart';

class CreateCalendar extends StatefulWidget {
  DateTime defaultValue;

  CreateCalendar(this.defaultValue, {Key key}) : super(key: key);

  @override
  _CreateCalendarState createState() => new _CreateCalendarState();
}

class _CreateCalendarState extends State<CreateCalendar> {
  DateTime _currentDate = DateTime.now();
  DateTime selectedDateTime = null;
  String _currentMonth = DateFormat.yMMM().format(DateTime.now());
  DateTime _targetDateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final calendarTextStyle = TextStyle(
        fontSize: getProportionateScreenWidth(16),
        color: kTextColor,
        fontFamily: "DINNext",
        textBaseline: TextBaseline.ideographic);

    final _calendarCarouselNoHeader = CalendarCarousel<Event>(
      todayBorderColor: Colors.transparent,
      onDayPressed: (date, events) {
        this.setState(() {
          selectedDateTime = date;

          CargsterShipperPostEntity currentPost =
              providerContainer.read(currentShipperPostProvider).state;
          currentPost.date = date.add(Duration(minutes: 1));
          providerContainer.read(currentShipperPostProvider).state =
              currentPost;
        });
      },
      daysHaveCircularBorder: true,
      showOnlyCurrentMonthDate: false,
      thisMonthDayBorderColor: Colors.transparent,
      weekFormat: false,
      showWeekDays: false,
      firstDayOfWeek: 1,
      height: 230.0,
      selectedDateTime: selectedDateTime ?? widget.defaultValue,
      targetDateTime: _targetDateTime,
      daysTextStyle: calendarTextStyle,
      weekendTextStyle: TextStyle(
        fontSize: getProportionateScreenWidth(16),
        color: kRedColor,
        fontFamily: "DINNext",
      ),
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomShapeBorder:
          CircleBorder(side: BorderSide(color: Colors.white)),
      markedDateCustomTextStyle: calendarTextStyle,
      showHeader: false,
      todayTextStyle: TextStyle(
        fontSize: getProportionateScreenWidth(16),
        color: Colors.white,
        fontFamily: "DINNext",
      ),
      todayButtonColor: kPrimaryLightColor,
      selectedDayButtonColor: kPrimaryColor,
      selectedDayTextStyle: TextStyle(
        color: Colors.white,
        fontSize: getProportionateScreenWidth(16),
        fontFamily: "DINNext",
      ),
      // minSelectedDate: _currentDate.subtract(Duration(days: 360)),
      // maxSelectedDate: _currentDate.add(Duration(days: 360)),
      prevDaysTextStyle: TextStyle(
        fontSize: getProportionateScreenWidth(16),
        color: kLightGreyColor,
        fontFamily: "DINNext",
      ),
      nextDaysTextStyle: TextStyle(
        fontSize: getProportionateScreenWidth(16),
        color: kLightGreyColor,
        fontFamily: "DINNext",
      ),
      inactiveDaysTextStyle: calendarTextStyle,
      onCalendarChanged: (DateTime date) {
        CargsterShipperPostEntity currentPost =
            providerContainer.read(currentShipperPostProvider).state;
        currentPost.date = date;
        providerContainer.read(currentShipperPostProvider).state = currentPost;
        this.setState(() {
          _targetDateTime = date;
          _currentMonth = DateFormat.yMMM().format(_targetDateTime);
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );

    return Container(
      height: SizeConfig.screenHeight * 0.45,
      width: SizeConfig.screenWidth * 0.8,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //custom icon without header
            Container(
              margin: EdgeInsets.only(
                top: getProportionateScreenHeight(0),
                bottom: 30.0,
                left: 5.0,
                right: 5.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: getProportionateScreenHeight(44),
                            child: Padding(
                              padding: EdgeInsets.only(
                                bottom: getProportionateScreenWidth(4),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/calendar-alt.svg',
                                    color: kDarkGreyColor,
                                    height: getProportionateScreenWidth(16),
                                    width: getProportionateScreenWidth(16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: getProportionateScreenWidth(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)
                                        .translate('create_only_date'),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(20),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(
                          getProportionateScreenWidth(10),
                          getProportionateScreenWidth(10),
                          getProportionateScreenWidth(10),
                          getProportionateScreenWidth(10),
                        ),
                        decoration: BoxDecoration(color: kBackgroundColor),
                        child: Padding(
                          padding: EdgeInsets.only(
                            bottom: getProportionateScreenWidth(0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                    child: SvgPicture.asset(
                                      'assets/icons/left-arrow.svg',
                                      color: kDarkGreyColor,
                                      height: getProportionateScreenWidth(14),
                                      width: getProportionateScreenWidth(14),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _targetDateTime = DateTime(
                                            _targetDateTime.year,
                                            _targetDateTime.month - 1);
                                        _currentMonth = DateFormat.yMMM()
                                            .format(_targetDateTime);
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          getProportionateScreenWidth(12),
                                          getProportionateScreenWidth(0),
                                          getProportionateScreenWidth(12),
                                          getProportionateScreenWidth(0)),
                                      child: Text(
                                        _currentMonth,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              getProportionateScreenWidth(16),
                                        ),
                                      )),
                                ],
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    child: SvgPicture.asset(
                                      'assets/icons/right-arrow.svg',
                                      color: kDarkGreyColor,
                                      height: getProportionateScreenWidth(14),
                                      width: getProportionateScreenWidth(14),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _targetDateTime = DateTime(
                                            _targetDateTime.year,
                                            _targetDateTime.month + 1);
                                        _currentMonth = DateFormat.yMMM()
                                            .format(_targetDateTime);
                                      });
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(bottom: SizeConfig.screenWidth * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: SizeConfig.screenWidth * 0.113,
                      child: Text('M',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Container(
                      width: SizeConfig.screenWidth * 0.113,
                      child: Text('T',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Container(
                      width: SizeConfig.screenWidth * 0.113,
                      child: Text('W',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Container(
                      width: SizeConfig.screenWidth * 0.113,
                      child: Text('T',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Container(
                      width: SizeConfig.screenWidth * 0.113,
                      child: Text('F',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Container(
                      width: SizeConfig.screenWidth * 0.113,
                      child: Text('S',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: kRedColor))),
                  Container(
                      width: SizeConfig.screenWidth * 0.113,
                      child: Text('S',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: kRedColor))),
                ],
              ),
            ),
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: _calendarCarouselNoHeader,
            ), //
          ],
        ),
      ),
    );
  }
}
