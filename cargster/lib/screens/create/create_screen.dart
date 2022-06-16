import 'package:booking_sdk/models/cargster/CargsterShipperPostEntity.dart';
import 'package:flutter/material.dart';

import './components/create_body.dart';
import '../../components/create_appbar.dart';
import '../../size_config.dart';

class CreateScreen extends StatelessWidget {
  static String routeName = "/create";
  CargsterShipperPostEntity entity;

  CreateScreen(this.entity);

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: CreateAppbar(),
      ),
      body: Column(
        children: [
          Flexible(
            child: Body(this.entity),
          ),
        ],
      ),
    );
  }
}
