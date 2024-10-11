import 'package:get/get.dart';

class ChatMessage {
  final String content;
  final bool isFromUser;

  ChatMessage({required this.content, required this.isFromUser});
}

class ChatAdminController extends GetxController {
  var messages = <ChatMessage>[].obs;

  // Function to send a message
  void sendMessage(String content, bool isFromUser) {
    messages.insert(0, ChatMessage(content: content, isFromUser: isFromUser));
  }
}
