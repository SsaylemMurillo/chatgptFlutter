import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<String> userMessages = [];

  void addMessage(String message) {
    setState(() {
      userMessages.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('New Conversation')),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: userMessages.length,
              itemBuilder: (BuildContext context, int index) {
                return MessageOwnBubble(message: userMessages[index]);
              }),
        ),
        bottomNavigationBar: MessageBar(
          onSendMessage: addMessage,
        ));
  }
}

class MessageBar extends StatefulWidget {
  final Function(String) onSendMessage;

  const MessageBar({Key? key, required this.onSendMessage}) : super(key: key);
  @override
  State<MessageBar> createState() => _MessageBarState();
}

class _MessageBarState extends State<MessageBar> {
  final TextEditingController _textController = TextEditingController();

  void sendMessage() {
    if (_textController.text.isNotEmpty) {
      widget.onSendMessage(_textController.text);
      _textController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: 65,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF40414F),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Send a message...',
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GestureDetector(
              onTap: sendMessage,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppTheme.accentColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(
                    CupertinoIcons.paperplane,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageOwnBubble extends StatelessWidget {
  const MessageOwnBubble({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF40414F),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}

class MessageChatGPTBubble extends StatelessWidget {
  const MessageChatGPTBubble({Key? key, required this.message})
      : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 5.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    CupertinoIcons.cloud_fill,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
              Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF40414F),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 10),
                        child: Text(message),
                      ),
                    ),
                  ]),
            ],
          ),
        ));
  }
}
