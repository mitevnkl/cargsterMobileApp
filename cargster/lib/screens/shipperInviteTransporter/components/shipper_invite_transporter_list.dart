import 'package:booking_sdk/models/PhoneContactEntity.dart';
import 'package:booking_sdk/services/phone_core_service.dart';
import 'package:cargster/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import './shipper_invite_transporter_item.dart';
import '../../../constants.dart';
import '../../../local/app_localizations.dart';
import '../../../size_config.dart';

class ShipperInviteTransporterList extends StatefulWidget {
  final String id;

  const ShipperInviteTransporterList({Key key, this.id}) : super(key: key);
  @override
  _ShipperInviteTransporterListState createState() =>
      _ShipperInviteTransporterListState();
}

class _ShipperInviteTransporterListState
    extends State<ShipperInviteTransporterList> {
  Future<Iterable<PhoneContactEntity>> phoneContacts;

  String searchTerm;

  List<PhoneContactEntity> selectedPhoneContacts;

  _ShipperInviteTransporterListState() {
    selectedPhoneContacts = new List.empty(growable: true);
    phoneContacts = PhoneCore.getContacts('');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: phoneContacts,
        builder: (BuildContext context,
            AsyncSnapshot<Iterable<PhoneContactEntity>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Container(
                  height: SizeConfig.screenHeight,
                  width: SizeConfig.screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: SizeConfig.screenHeight * 0.02),
                          Text('Please wait while your contacts are loading...',
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(18)))
                        ],
                      )
                    ],
                  ));
            default:
              if (snapshot.data != null) {
                return Container(
                  height: SizeConfig.screenHeight,
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                          physics: ScrollPhysics(),
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: getProportionateScreenWidth(30)),
                                  child: Column(
                                    children: [
                                      Container(
                                          child: Text(
                                            AppLocalizations.of(context)
                                                .translate(
                                                    'invite_transporter'),
                                            style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      20),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          width: SizeConfig.screenWidth * 0.9),
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: getProportionateScreenWidth(
                                                  20)),
                                          child: TextFormField(
                                            keyboardType: TextInputType.name,
                                            initialValue: searchTerm,
                                            onChanged: (value) {
                                              print('1');
                                              if (value.isNotEmpty) {
                                                this.setState(() {
                                                  searchTerm = value;
                                                  phoneContacts =
                                                      PhoneCore.getContacts(
                                                          value);
                                                });
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              hintText: AppLocalizations.of(
                                                      context)
                                                  .translate('search_contacts'),
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.never,
                                            ),
                                          ),
                                          width: SizeConfig.screenWidth * 0.9),
                                    ],
                                  )),
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data == null
                                    ? 0
                                    : snapshot.data.length,
                                shrinkWrap: true,
                                itemBuilder:
                                    (BuildContext context, int index) =>
                                        buildShipperInviteTransportersItem(
                                            context,
                                            snapshot.data.elementAt(index),
                                            selectedPhoneContacts,
                                            this.setState),
                              ),
                            ],
                          )),
                      Positioned(
                        left: SizeConfig.screenWidth / 2 -
                            SizeConfig.screenWidth * 0.35,
                        bottom: 50.0,
                        child: InkWell(
                            child: Container(
                              child: Container(
                                width: SizeConfig.screenWidth * 0.7,
                                height: getProportionateScreenHeight(52),
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      getProportionateScreenWidth(10),
                                      getProportionateScreenWidth(12),
                                      getProportionateScreenWidth(10),
                                      getProportionateScreenWidth(12)),
                                  child: Text(
                                      AppLocalizations.of(context)
                                          .translate('import'),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              getProportionateScreenWidth(20),
                                          color: Colors.white)),
                                ),
                              ),
                            ),
                            onTap: () async {
                              // TODO Send sms to bunch of people
                              PhoneCore.sendSms(selectedPhoneContacts,
                                  "Hey, We are using Cargster app to communicate with our transporters. I'm inviting you to see my load request that I want you to take. Download app here {link}!");

                              Navigator.pushNamed(
                                  context, HomeScreen.routeName);
                              print('INVITE');
                              // TODO get contacts from phone
                              // Iterable<PhoneContactEntity> contacts =
                              //     await PhoneCore.getContacts();
                              // print(contacts.first.name);
                              // print(contacts.first.phone);

                              // TODO Send sms to bunch of people
                              // PhoneCore.sendSms(
                              //     [new PhoneContactEntity("VALERA", "+4531195059")],
                              //     "Hi mister!");

                              // Navigator.pushNamed(context, CreateScreen.routeName);
                            }),
                      ),
                    ],
                  ),
                );
              }
          }
          return CircularProgressIndicator();
        });
  }
}
