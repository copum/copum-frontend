class UserModel {
  late String email;
  late String profile;
  late String? profile_image;
  UserModel({email, profile, profile_image});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    profile = json['profile'];
    profile_image = json["profile_image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['profile'] = profile;
    data['profile_image'] = profile_image;

    return data;
  }
}
