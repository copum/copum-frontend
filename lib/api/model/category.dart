import 'package:copum/screen/tmp.dart';

class CategoryModel {
  late int? id;
  late String? name;

  CategoryModel({id, name});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_name'] = name;
    return data;
  }
}
