class UserModel {
  late String email;
  late String profile;
  late String? profile_image;
  late int user_id;
  UserModel({email, profile, profile_image, user_id});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    profile = json['profile'];
    profile_image = json["profile_image"];
    user_id = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['profile'] = profile;
    data['profile_image'] = profile_image;
    data['user_id'] = user_id;

    return data;
  }
}
