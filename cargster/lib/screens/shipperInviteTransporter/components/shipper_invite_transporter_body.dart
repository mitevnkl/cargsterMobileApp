import 'package:flutter/material.dart';

import './shipper_invite_transporter_list.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  final String id;

  const Body({Key key, this.id}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0.0, right: 0.0, bottom: 0.0, top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              //TODO:
                              //place here 'contact joined' card
                              SizedBox(height: SizeConfig.screenHeight * 0.02),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(child: ShipperInviteTransporterList(id: widget.id)),
              // Container(
              //     child: TextFormField(
              //   initialValue: 'Hi hello',
              //   keyboardType: TextInputType.name,
              //   // onSaved: (newValue) => name = newValue,
              // )),
            ],
          ),
        ),
      ],
    );
  }
}
// TODO Implement this library.
