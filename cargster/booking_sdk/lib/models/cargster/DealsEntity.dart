class DealsEntity {
  static const String POST_ID_FIELD_NAME = 'postId';

  String id;
  String postId;
  String transporterId;
  String userId;

  DealsEntity({this.id, this.postId, this.transporterId, this.userId});

  Map<String, dynamic> toMap() {
    return {
      "postId": postId,
      "transporterId": transporterId,
      "shipperId": userId,
    };
  }

  factory DealsEntity.fromDS(id, Map<String, dynamic> data) {
    if (data == null) return null;

    return DealsEntity(
      id: id,
      postId: data['postId'],
      transporterId: data['transporterId'],
      userId: data['userId'],
    );
  }
}
