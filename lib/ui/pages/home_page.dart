import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: MainContent()));
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

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const _InformationCard(
          label: 'Examples',
          icon: CupertinoIcons.sun_max,
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
      ],
    );
  }
}
