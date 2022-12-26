class UserModel {
  late int id;
  late String userId;
  late String email;
  late String? profileImage;
  late String loginType;
  UserModel({id, userId, email, profileImage, loginType});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    email = json['email'];
    profileImage = json["profile_image"] ?? null;
    loginType = json["login_type"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['email'] = email;
    data['profileImage'] = profileImage;
    data['loginType'] = loginType;
    return data;
  }

  @override
  String toString() {
    return '{id: ${id}, userId: ${userId}, email: ${email}, profileImage: ${profileImage}, loginType ${loginType}}';
  }
}
