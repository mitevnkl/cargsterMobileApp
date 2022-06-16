import 'package:booking_sdk/models/cargster/CargsterShipperPostEntity.dart';
import 'package:booking_sdk/providers/firebase_providers.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../components/address_search.dart';
import '../../../components/place_service.dart';
import '../../../local/app_localizations.dart';
import '../../../main.dart';
import '../../../size_config.dart';

class GooglePlacesField extends StatefulWidget {
  final String title;
  final String type;
  String defaultPlaceId;
  String defaultPlaceDescription;

  GooglePlacesField(this.defaultPlaceId, this.defaultPlaceDescription,
      {Key key, this.title, this.type})
      : super(key: key);

  @override
  _GooglePlacesFieldState createState() => _GooglePlacesFieldState();
}

class _GooglePlacesFieldState extends State<GooglePlacesField> {
  TextEditingController _controller;

  String _placeID;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.defaultPlaceDescription);
  }

  // IF WE WOULD NEED DETAILS
  // String _streetNumber = '';
  // String _street = '';
  // String _city = '';
  // String _zipCode = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: SizeConfig.screenHeight * 0.022),
          TextField(
            controller: _controller,
            readOnly: true,
            onTap: () async {
              // generate a new token here
              final sessionToken = Uuid().v4();
              final Suggestion result = await showSearch(
                context: context,
                delegate: AddressSearch(sessionToken),
              );
              // This will change the text displayed in the TextField
              if (result != null) {
                CargsterShipperPostEntity currentPost =
                    providerContainer.read(currentShipperPostProvider).state;

                // TODO Make it generic.
                if (widget.type == 'pickUp') {
                  currentPost.pickUp.id = result.placeId;
                  currentPost.pickUp.placeDescription = result.description;
                }
                if (widget.type == 'dropOff') {
                  currentPost.dropOff.id = result.placeId;
                  currentPost.dropOff.placeDescription = result.description;
                }
                if (widget.type == 'pickUpCustoms') {
                  currentPost.pickUp.customsId = result.placeId;
                  currentPost.pickUp.customsPlaceDescription =
                      result.description;
                }
                if (widget.type == 'dropOffCustoms') {
                  currentPost.dropOff.customsId = result.placeId;
                  currentPost.dropOff.customsPlaceDescription =
                      result.description;
                }
                providerContainer.read(currentShipperPostProvider).state =
                    currentPost;

                print(result);

                String trimmedDescription = (result.description.length <= 28)
                    ? result.description
                    : '${result.description.substring(0, 28)}...';

                // IF WE WOULD NEED DETAILS
                // final placeDetails = await PlaceApiProvider(sessionToken)
                //     .getPlaceDetailFromId(result.placeId);

                setState(() {
                  _controller.text = trimmedDescription;
                  _placeID = result.placeId;

                  // IF WE WOULD NEED DETAILS
                  // _streetNumber = placeDetails.streetNumber;
                  // _street = placeDetails.street;
                  // _city = placeDetails.city;
                  // _zipCode = placeDetails.zipCode;
                });
              }
            },
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context).translate('city_hint'),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.022),

          // IF WE WOULD NEED DETAILS
          // Text('Street Number: $_streetNumber'),
          // Text('Street: $_street'),
          // Text('City: $_city'),
          // Text('ZIP Code: $_zipCode'),
        ],
      ),
    );
  }
}
