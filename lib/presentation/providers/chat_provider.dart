import 'package:flutter/material.dart';

import 'package:yes_no_app/config/api/yes_no_api.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoanswer = YesNoApi();

  List<Message> messageList = [
    Message(text: 'Hola Humano', fromWho: FromWho.me),
    Message(text: 'Tienes tu sharingan activo', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      await herReply();
    }

    notifyListeners();
    await moveScrollTobotton();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoanswer.getYesNoData();
    messageList.add(herMessage);

    notifyListeners();
    await moveScrollTobotton();
  }

  Future<void> moveScrollTobotton() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
