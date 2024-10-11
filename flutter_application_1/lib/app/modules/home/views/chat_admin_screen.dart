import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/chat_admin_controller.dart';

class ChatAdminScreen extends StatelessWidget {
  final ChatAdminController _chatAdminController = Get.put(ChatAdminController());
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat dengan Admin'),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          // Expanded widget to display chat messages
          Expanded(
            child: Obx(() {
              return ListView.builder(
                reverse: true,
                itemCount: _chatAdminController.messages.length,
                itemBuilder: (context, index) {
                  final message = _chatAdminController.messages[index];
                  return Align(
                    alignment: message.isFromUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      padding: EdgeInsets.all(10),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.7, // Maksimal 70% dari lebar layar
                      ),
                      decoration: BoxDecoration(
                        color: message.isFromUser ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SingleChildScrollView( // To prevent overflow on long text
                        child: Text(
                          message.content,
                          style: TextStyle(
                            color: message.isFromUser ? Colors.white : Colors.black,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),

          // Text input field for sending messages
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Tulis pesan...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.brown),
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      _chatAdminController.sendMessage(
                        _messageController.text,
                        true, // This is from user
                      );
                      _messageController.clear();

                      // Simulate response from admin
                      Future.delayed(Duration(seconds: 1), () {
                        _chatAdminController.sendMessage(
                          'Pesan diterima, bagaimana saya bisa membantu Anda?',
                          false, // This is from admin
                        );
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
