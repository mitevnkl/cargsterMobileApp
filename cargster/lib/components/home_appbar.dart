import 'dart:io';

import 'package:booking_sdk/models/cargster/CargsterUserEntity.dart';
import 'package:booking_sdk/providers/firebase_providers.dart';
import 'package:cargster/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/user_image_picker.dart';
import '../local/app_localizations.dart';
import '../size_config.dart';

class HomeAppbar extends StatefulWidget {
  @override
  _HomeAppbarState createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar> {
  File _userImageFile;

  void _pickedImageFunction(File image) {
    _userImageFile = image;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      Future<CargsterUserEntity> cargsterUserEntity =
          watch(currentCargsterUserEntityProvider).state;

      return AppBar(
        leading: new Container(),
        flexibleSpace: Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(getProportionateScreenHeight(30), 40.0,
              getProportionateScreenHeight(30), 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: FutureBuilder(
                      future: cargsterUserEntity,
                      builder: (BuildContext context,
                          AsyncSnapshot<CargsterUserEntity> snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return CircularProgressIndicator();
                          default:
                            CargsterUserEntity user = snapshot.data;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                user != null
                                    ? Text(
                                        //TODO show user name
                                        '${AppLocalizations.of(context).translate('home_header')} ' +
                                            user.name +
                                            ' ' +
                                            user.surname,
                                        style: headingStyle,
                                      )
                                    : new CircularProgressIndicator(),
                                UserImagePicker(_pickedImageFunction,
                                    //TODO put url from firestore to selectedImage
                                    selectedImage: null)
                              ],
                            );
                        }
                      }))
            ],
          ),
        ),
      );
    });
  }
}
