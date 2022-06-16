import 'package:flutter/material.dart';
import 'package:booking_sdk/models/cargster/CargsterShipperPostEntity.dart';
import 'package:booking_sdk/providers/firebase_providers.dart';
import '../../../size_config.dart';
import '../../../constants.dart';
import '../../../main.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../local/app_localizations.dart';
import 'dart:convert';
import 'dart:math';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CreateTime extends StatefulWidget {
  DateTime defaultValue;

  CreateTime(this.defaultValue, {Key key}) : super(key: key);

  @override
  _CreateTimeState createState() => new _CreateTimeState();
}

extension DateTimeExtension on DateTime {
  DateTime roundDown({Duration delta = const Duration(days: 1)}) {
    return DateTime.fromMillisecondsSinceEpoch(
        millisecondsSinceEpoch - millisecondsSinceEpoch % delta.inMilliseconds);
  }
}

class _CreateTimeState extends State<CreateTime> {
  int selectedIndex = 0;

  static ItemScrollController itemScrollController = ItemScrollController();
  static ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();
    CargsterShipperPostEntity currentPost =
        providerContainer.read(currentShipperPostProvider).state;

      if (currentPost.date != null) {
        selectedIndex = currentPost.date.hour;

        itemScrollController = ItemScrollController();
        itemPositionsListener = ItemPositionsListener.create();
        
        WidgetsBinding.instance.addPostFrameCallback((duration) {
          Future.delayed(const Duration(milliseconds: 50), () {
            itemScrollController?.scrollTo(
                index: currentPost.date.hour, duration: Duration(milliseconds: 200));
          });
        });
      }
    
  }

  Widget build(BuildContext context) {
    return Container(
      // height: SizeConfig.screenHeight * 0.16,
      width: SizeConfig.screenWidth * 0.8,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: getProportionateScreenHeight(10),
                bottom: 10.0,
                left: 5.0,
                right: 5.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                                    'assets/icons/time.svg',
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
                                        .translate('create_only_time'),
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
                ],
              ),
            ),
            Container(
              width: SizeConfig.screenWidth * 0.75,
              height: getProportionateScreenHeight(60),
              child: ScrollablePositionedList.builder(
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                itemCount: 24,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          0,
                          getProportionateScreenHeight(5),
                          getProportionateScreenHeight(15),
                          getProportionateScreenHeight(5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.fromLTRB(
                                getProportionateScreenHeight(25),
                                getProportionateScreenHeight(10),
                                getProportionateScreenHeight(25),
                                getProportionateScreenHeight(10),
                              ),
                              child: index > 8
                                  ? Text('${index}:00')
                                  : Text(
                                      '${index}:00',
                                    )),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? kPrimaryLightColor
                            : kLightGreyColor,
                      ),
                    ),
                    onTap: () {
                      CargsterShipperPostEntity currentPost = providerContainer
                          .read(currentShipperPostProvider)
                          .state;

                      if (index == 0) {
                        ;
                        currentPost.date = currentPost.date;
                      } else if (index == 23) {
                        currentPost.date =
                            currentPost.date.add(Duration(hours: 23));
                      } else {
                        currentPost.date = currentPost.date
                            .roundDown(delta: Duration(hours: 23));
                        currentPost.date =
                            currentPost.date.add(Duration(hours: index + 4));
                      }

                      providerContainer.read(currentShipperPostProvider).state =
                          currentPost;
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
