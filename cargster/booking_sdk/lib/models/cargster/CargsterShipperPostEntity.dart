class CargsterShipperPostEntity {
  static const String USER_ID_FIELD_NAME = 'userId';
  String id;
  DateTime date;
  CargsterShipperAddressEntity pickUp;
  CargsterShipperAddressEntity dropOff;
  CargsterShipperVehicleType vehicleType;
  bool adr;
  String price;
  String currency;
  String userId;

  CargsterShipperPostEntity(
      {this.id,
      this.date,
      this.pickUp,
      this.dropOff,
      this.vehicleType,
      this.adr,
      this.price,
      this.currency,
      this.userId}) {
    if (this.vehicleType == null) {
      this.vehicleType = new CargsterShipperVehicleType();
    }
    if (this.pickUp == null) {
      this.pickUp = new CargsterShipperAddressEntity();
    }
    if (this.dropOff == null) {
      this.dropOff = new CargsterShipperAddressEntity();
    }
  }

  Map<String, dynamic> toMap() {
    return {
      "date": date != null ? date.millisecondsSinceEpoch : null,
      "pickUp": pickUp != null ? pickUp.toMap() : null,
      "dropOff": dropOff != null ? dropOff.toMap() : null,
      "vehicleType": vehicleType != null ? vehicleType.toMap() : null,
      "adr": adr,
      "price": price,
      "currency": currency,
      "userId": userId
    };
  }

  factory CargsterShipperPostEntity.fromDS(id, Map<String, dynamic> data) {
    if (data == null) return null;

    return CargsterShipperPostEntity(
        id: id,
        date: DateTime.fromMillisecondsSinceEpoch(data['date']),
        pickUp: CargsterShipperAddressEntity.fromDS(data['pickUp']),
        dropOff: CargsterShipperAddressEntity.fromDS(data['dropOff']),
        vehicleType: CargsterShipperVehicleType.fromDS(data['vehicleType']),
        adr: data['adr'],
        price: data['price'],
        currency: data['currency'],
        userId: data['userId']);
  }

  void merge(CargsterShipperPostEntity entity) {
    this.pickUp = entity.pickUp;
    this.dropOff = entity.dropOff;
    this.vehicleType = entity.vehicleType;
    this.price = entity.price;
  }
}

class CargsterShipperVehicleType {
  Map<String, dynamic> vehicleType;
  CargsterShipperVehicleType({this.vehicleType});

  Map<String, dynamic> toMap() {
    return {
      "vehicleType": vehicleType,
    };
  }

  factory CargsterShipperVehicleType.fromDS(Map<String, dynamic> data) {
    if (data == null) return null;

    return CargsterShipperVehicleType(vehicleType: data['vehicleType']);
  }

  @override
  String toString() {
    if (this.vehicleType == null) {
      return 'null';
    }
    List<String> result = new List.empty(growable: true);
    this.vehicleType.entries.forEach((element) {
      element.value == true ? result.add(element.key) : null;
    });
    return result.join(', ');
  }
}

class CargsterShipperAddressEntity {
  String id;
  String companyName;
  String customs;
  String customsId;
  String customsPlaceDescription;
  String placeDescription;
  String address;

  CargsterShipperAddressEntity(
      {this.id,
      this.companyName,
      this.customs,
      this.customsId,
      this.customsPlaceDescription,
      this.placeDescription,
      this.address});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "companyName": companyName,
      "customs": customs,
      "customsId": customsId,
      "customsPlaceDescription": customsPlaceDescription,
      "placeDescription": placeDescription,
      "address": address
    };
  }

  factory CargsterShipperAddressEntity.fromDS(Map<String, dynamic> data) {
    if (data == null) return null;

    return CargsterShipperAddressEntity(
        id: data['id'],
        companyName: data['companyName'],
        customs: data['customs'],
        customsId: data['customsId'],
        customsPlaceDescription: data['customsPlaceDescription'],
        placeDescription: data['placeDescription'],
        address: data['address']);
  }

  @override
  String toString() {
    return this.companyName ?? 'null';
  }
}
