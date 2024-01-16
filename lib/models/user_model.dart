class UserData {
  final String uId;
  final String email;

  UserData({required this.uId, required this.email});

  factory UserData.fromMap(Map<String, dynamic> map, String documentId) {
    return UserData(
      uId: documentId,
      email: map['email'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({
      'uId': uId,
    });
    result.addAll({
      'email': email,
    });
    return result;
  }
}
