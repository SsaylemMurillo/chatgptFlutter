import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final pageTitles = const [
    'Examples',
    'Capabilities',
    'Limitations',
  ];
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: Column(children: [
                    Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.all(0.0),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('assets/chatgpt.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "ChatGPT",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    const _InformationCard(
                      label: 'Examples',
                      icon: CupertinoIcons.home,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const _InformationCard(
                      label: 'Capabilities',
                      icon: CupertinoIcons.bolt,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const _InformationCard(
                      label: 'Limitations',
                      icon: CupertinoIcons.exclamationmark_triangle,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  height: 50,
                  width: 400,
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
                padding: const EdgeInsets.only(left: 5.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 60,
                    decoration: BoxDecoration(
                      color: AppTheme.accentColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      CupertinoIcons.paperplane,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _InformationCard extends StatelessWidget {
  const _InformationCard({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: const Color(0xFF40414F),
              content: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Text("Here is a request."),
              ),
            );
          },
        );
      },
      child: Container(
        height: 100,
        width: 100,
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF40414F),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Color(0xFFB1B3C1)),
            ),
            const SizedBox(
              height: 10,
            ),
            Icon(
              icon,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
