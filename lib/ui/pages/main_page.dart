import 'package:chat_gpt_mobile/ui/pages/login_page.dart';
import 'package:chat_gpt_mobile/ui/pages/register_page.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  height: 40,
                ),
                // Main Title!
                const Text(
                  'Welcome to ChatGPT',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Please Log in with your account to continue',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 50,
                ),
                // Sign In Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppTheme.accentColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          'Log In',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Main Title!
                const Text(
                  'Or',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 10,
                ),
                // Sign Up Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppTheme.accentColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
