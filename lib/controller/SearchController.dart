import 'package:get/get.dart';
class SearchController extends GetxController{
  Rx<String> search = ''.obs;

  onChange(String search) => search=search;
}