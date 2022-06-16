import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppEvent {
  String title;
  String id;
  DateTime date;
  String userId;
  // Who made the change last time, for firebase functions trigger.
  String lastUpdatedUserId;
  String imageUrl;
  String documentID;
  String content;
  String type;
  List<String> fileUrls;

  AppEvent({
    this.title,
    this.id,
    this.date,
    this.userId,
    this.lastUpdatedUserId,
    this.imageUrl,
    this.content,
    this.fileUrls,
    this.type,
    this.documentID
  });

  AppEvent copyWith({
    String title,
    String id,
    DateTime date,
    String userId,
    String lastUpdatedUserId,
    bool imageUrl,
    String content,
    String documentID,
    String type,
    List<String> fileUrls
  }) {
    return AppEvent(
      title: title ?? this.title,
      id: id ?? this.id,
      date: date ?? this.date,
      userId: userId ?? this.userId,
      lastUpdatedUserId: lastUpdatedUserId ?? this.lastUpdatedUserId,
      imageUrl: imageUrl ?? this.imageUrl,
      content: content ?? this.content,
      fileUrls: fileUrls ?? this.fileUrls,
      type: type ?? this.type,
      documentID: documentID ?? this.documentID
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'id': id,
      'date': date.millisecondsSinceEpoch,
      'userId': userId,
      'lastUpdatedUserId': lastUpdatedUserId,
      'imageUrl': imageUrl,
      'content': content,
      'fileUrls': fileUrls,
      'type': type,
      'documentID': documentID
    };
  }

  // creating a AppEvent object from a firebase snapshot
  AppEvent.fromSnapshot(DocumentSnapshot snapshot) :
      title = snapshot['title'],
      date = DateTime.fromMillisecondsSinceEpoch(snapshot['date']),
      content = snapshot['content'],
      imageUrl = snapshot['imageUrl'],
      userId = snapshot['userId'],
      type = snapshot['type'],
      lastUpdatedUserId = snapshot['lastUpdatedUserId'],
      fileUrls = (snapshot['fileUrls'] != null ? snapshot['fileUrls'].map<String>((document) {
        return document.toString();
      }).toList() : []),
      documentID = snapshot.id;

  factory AppEvent.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AppEvent(
      title: map['title'],
      id: map['id'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      userId: map['userId'],
      lastUpdatedUserId: map['lastUpdatedUserId'],
      imageUrl: map['imageUrl'],
      content: map['content'],
      fileUrls: map['fileUrls'],
      type: map['type'],
      documentID: map['documentID']
    );
  }
  factory AppEvent.fromDS(String id, Map<String, dynamic> data) {
    if (data == null) return null;


    return AppEvent(
      title: data['title'],
      id: id,
      date: DateTime.fromMillisecondsSinceEpoch(data['date']),
      userId: data['userId'],
      lastUpdatedUserId: data['lastUpdatedUserId'],
      imageUrl: data['imageUrl'],
      content: data['content'],
      documentID: data['documentID'],
      type: data['type'],
      fileUrls: (data['fileUrls'] != null ? data['fileUrls'].map<String>((document) {
        return document.toString();
      }).toList() : [])
    );
  }

  String toJson() => json.encode(toMap());

  factory AppEvent.fromJson(String source) =>
      AppEvent.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppEvent(title: $title, id: $id, date: $date, type: $type , userId: $userId, lastUpdatedUserId: $lastUpdatedUserId, imageUrl: $imageUrl , content $content , fileUrls $fileUrls , documentID $documentID)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AppEvent &&
        o.title == title &&
        o.id == id &&
        o.date == date &&
        o.userId == userId &&
        o.lastUpdatedUserId == lastUpdatedUserId &&
        o.imageUrl == imageUrl &&
        o.content == content &&
        o.documentID == documentID &&
        o.type == type &&
        o.fileUrls == fileUrls;
  }

  @override
  int get hashCode {
    return title.hashCode ^
    id.hashCode ^
    date.hashCode ^
    userId.hashCode ^
    lastUpdatedUserId.hashCode ^
    imageUrl.hashCode ^
    content.hashCode ^
    documentID.hashCode ^
    type.hashCode ^
    fileUrls.hashCode;
  }
}
