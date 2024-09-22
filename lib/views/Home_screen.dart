import 'package:flutter/material.dart';
import 'package:login_register_form/widgets/login_botton_sheet.dart';
import 'package:login_register_form/widgets/register_bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Stack(
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 50), // Space at the top before the image
                Image(
                  image: NetworkImage(
                      'https://img.freepik.com/premium-vector/guardian-digital-realm-mans-vigilance-login-gate_1134661-21312.jpg?w=740'),
                  width: 500,
                  height: 500,
                ),
                SizedBox(height: 3), // Smaller SizedBox height
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFBF4B4B),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 15.0), // Reduced vertical padding
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Create Account button with fixed width
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => const RegisterBottomSheet(),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: const Color(0xFF182C47),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minimumSize: const Size.fromHeight(50),
                        ),
                        child: const Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Space between buttons

                    // Login button with fixed width
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) => const LoginBottomSheet(),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: const BorderSide(
                              color: Color(0xFF182C47), width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minimumSize: const Size.fromHeight(50),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF182C47),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                        height: 100), // Space added at the end of the page
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
