import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserEntity {
  String id;
  String email;
  String password;
  Timestamp createdAt;

  String firstName;
  String lastName;
  String address;
  String phoneNumber;

  UserEntity(
      {this.id,
      @required this.email,
      this.password,
      this.createdAt,
      this.firstName,
      this.lastName,
      this.address,
      this.phoneNumber
    });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "password": password,
      "createdAt": createdAt,
      "firstName": firstName,
      "lastName": lastName,
      "address": address,
      "phoneNumber": phoneNumber,
    };
  }

  factory UserEntity.fromDS(Map<String, dynamic> data) {
    if (data == null) return null;

    return UserEntity(
      id: data['id'],
      email: data['email'],
      password: data['password'],
      createdAt: data['createdAt'],
      firstName: data['firstName'],
      lastName: data['lastName'],
      address: data['address'],
      phoneNumber: data['phoneNumber'],
    );
  }
}
