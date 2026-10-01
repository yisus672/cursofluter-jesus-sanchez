import 'package:chat_1/domain/entities/message.dart';
import 'package:chat_1/infrastructure/models/yes_no_model.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {
  final _dio = Dio();  

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');


    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}