import 'package:dio/dio.dart';

import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infractructure/models/yes_no_model.dart';

class YesNoApi {
  final _dio = Dio();

  Future<Message> getYesNoData() async {
    final res = await _dio.get('https://yesno.wtf/api');
    final yesNoResp = YesNoModel.fromJsonMap(res.data);

    return Message(
      text: yesNoResp.answer,
      fromWho: FromWho.hers,
      imageUrl: yesNoResp.image,
    );
  }
}
