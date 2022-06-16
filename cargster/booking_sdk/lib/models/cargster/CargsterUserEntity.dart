import 'dart:io';
class CargsterUserEntity {
  String id;
  String companyName;
  String headquarters;
  String name;
  String surname;
  String type;
  File image;

  CargsterUserEntity(
      {this.id,
      this.companyName,
      this.headquarters,
      this.name,
      this.surname,
      this.type,
      this.image});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "companyName": companyName,
      "headquarters": headquarters,
      "name": name,
      "surname": surname,
      "type": type,
      "image": image
    };
  }

  factory CargsterUserEntity.fromDS(id, Map<String, dynamic> data) {
    if (data == null) return null;

    return CargsterUserEntity(
      id: id,
      companyName: data['companyName'],
      headquarters: data['headquarters'],
      name: data['name'],
      surname: data['surname'],
      type: data['type'],
      image: data['image']
    );
  }
}
