import 'package:flutter/material.dart';
import 'package:login_register_form/controllers/user_controllers.dart';
import 'register_bottom_sheet.dart'; // Import RegisterBottomSheet for registration link

class LoginBottomSheet extends StatefulWidget {
  const LoginBottomSheet({super.key});

  @override
  State<LoginBottomSheet> createState() => LoginBottomSheetState();
}

class LoginBottomSheetState extends State<LoginBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userController = UserController();
  bool _isLoading = false;
  bool _remindMe = false; // State for "Remind me" checkbox

  void _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });
      try {
        // ignore: avoid_print
        print(
            "Attempting login with: ${_usernameController.text}, ${_passwordController.text}");
        // ignore: avoid_print
        print("Remind me: $_remindMe");

        final user = _userController.createUser(
            _usernameController.text, _passwordController.text);

        // ignore: avoid_print
        print("Login successful for: ${user.username}");
        Navigator.pop(context); // Close the modal on successful login
      } catch (e) {
        // ignore: avoid_print
        print("Login failed: ${e.toString()}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login failed: ${e.toString()}")),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      // ignore: avoid_print
      print("Login failed: Validation errors.");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: [
          // Align the Login header to the left
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Login", // Header text
              style: TextStyle(
                fontSize: 24, // Font size for the header
                fontWeight: FontWeight.bold, // Bold font
                color: Color(0xFF182C47), // Set the color
              ),
            ),
          ),
          const SizedBox(height: 20), // Space below the header
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Username",
                        border: OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                      controller: _usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                      ),
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: _remindMe,
                              onChanged: (bool? value) {
                                setState(() {
                                  _remindMe = value ?? false;
                                });
                              },
                            ),
                            const Text("Remember me"),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle "Forget Password?" action
                            // ignore: avoid_print
                            print("Forget Password tapped");
                          },
                          child: const Text(
                            "Forget Password?",
                            style: TextStyle(
                              color: Color(0xFF182C47),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _submit,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 32),
                        minimumSize: const Size(200, 50),
                        backgroundColor: const Color(0xFF182C47),
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            )
                          : const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                    const SizedBox(
                        height: 20), // Space before the registration text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pop(); // Close the Login Bottom Sheet
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) => const RegisterBottomSheet(),
                            );
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              color: Color.fromARGB(255, 236, 32, 32),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
