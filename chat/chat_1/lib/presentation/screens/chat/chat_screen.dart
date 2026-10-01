import 'package:chat_1/domain/entities/message.dart';
import 'package:chat_1/presentation/widgets/chat/my_message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:chat_1/presentation/widgets/chat/her_message_bubble.dart';
import 'package:chat_1/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';
import 'package:chat_1/presentation/providers/chat_provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh0kax0BHW6isydUGCtf5YKQ7wzfSkQbzJgKvRVRlinrYWf6xPNMKv8bJwVmc3X7-b0cBK46mQRKH-GVGRbpUZCDgYiapyLkExhGuXhPPvLRDtsWShMomEdlmruBo1H2zjW6MafVvMLuMpZ/s748/P1050015a.JPG'),
          ),
        ),
        title: const Text('@Cat🐱'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  // Corregido: Si el mensaje es de ella, muestra HerMessageBubble
                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(message: message);
                },
              ),
            ),
            
            // Caja de texto
            MessageFieldBox(
              onValue: ((value) => chatProvider.sendMessage(value)),
            ),
          ],
        ),
      ),
    );
  }
}