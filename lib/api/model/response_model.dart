import 'package:copum/api/model/boardmodel.dart';

class ResponseModel {
  List<BoardModel>? boardModel;
  Exception? exception;

  ResponseModel({this.boardModel, this.exception});
}
