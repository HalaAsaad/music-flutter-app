// import 'dart:html';

import 'package:flutter/material.dart';
//import 'package:musicapp/services/auth.dart';
import 'package:http/http.dart' as http;
// import 'dart:convert';

import 'package:http/http.dart';

class CustomTextStyleLogin {
  static const TextStyle title = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.blue, // Adjust color based on your theme
    fontFamily: 'Inter', // Replace with your desired font family (optional)
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Colors.white, // Adjust color based on your theme
    fontFamily: 'Inter', // Replace with your desired font family (optional)
  );
}

class User {
  final String username;
  final String password;

  const User({required this.username, required this.password});
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void login(String username, String password) async {
    // Navigator.of(context).pushNamed("home"); // to delete when request success
    Response response = await http.post(
        Uri.parse('https://amphibological-doze.000webhostapp.com/Login.php'),
        body: {'userName': username, 'userPassword': password});

    if (response.statusCode == 200) {
      // Handle successful login (e.g., navigate to another page)
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushNamed("home");
      // ignore: avoid_print
      print('Login successful!');
    } else {
      // Handle login failure (e.g., show error message)
      // ignore: avoid_print
      print('Login failed: ${response.statusCode}');
      // ignore: avoid_print
      print('Login failed: ${response.body}');

      // Show an appropriate error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        leading: null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Username field
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                // onSaved: (value) => setState(() => _username = value!),
              ),
              // Password field
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                // onSaved: (value) => setState(() => _password = value!),
              ),
              const SizedBox(height: 15.0),
              // Login button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(
                      double.infinity, 50.0), // Set minimum button size
                  backgroundColor: Colors.blue[700], // Set button color
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    login(
                        emailController.text.toString(),
                        passwordController.text
                            .toString()); // Call login function
                  }
                },
                child: const Text(
                  'Login',
                  style: CustomTextStyleLogin.buttonText,
                ),
              ),
              const SizedBox(height: 15.0),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("signup");
                },
                child: const Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
