// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  // String? _username = "";
  // String? _email = "";
  // String? _password = "";
  bool _showPassword = false; // For password visibility toggle
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'), // Set app bar title
      ),
      body: SingleChildScrollView(
        // Allow scrolling if content overflows
        padding: const EdgeInsets.all(20.0), // Add padding for aesthetics
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align labels to left
            children: [
              // Username field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null; // Return null for valid input
                },
                // onSaved: (newValue) => _username = newValue!,
              ),

              const SizedBox(height: 20.0), // Add spacing
              // FName field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Firstname',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Firstname';
                  }
                  return null; // Return null for valid input
                },
                // onSaved: (newValue) => _username = newValue!,
              ),

              const SizedBox(height: 20.0), // Add spacing
              // LName field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Lastname',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Lastname';
                  }
                  return null; // Return null for valid input
                },
                // onSaved: (newValue) => _username = newValue!,
              ),

              const SizedBox(height: 20.0), // Add spacing
              // Address field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Address';
                  }
                  return null; // Return null for valid input
                },
                // onSaved: (newValue) => _username = newValue!,
              ),

              const SizedBox(height: 20.0), // Add spacing
              // Email field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                controller: emailController,
                keyboardType: TextInputType.emailAddress, // Set keyboard type
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email address';
                  } else if (!RegExp(r"\S+@\S+\.\S+").hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null; // Return null for valid input
                },
                // onSaved: (newValue) => _email = newValue!,
              ),

              const SizedBox(height: 20.0), // Add spacing

              // Password field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () =>
                        setState(() => _showPassword = !_showPassword),
                  ),
                ),
                controller: passwordController,
                obscureText: !_showPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null; // Return null for valid input (consider complexity rules)
                },
                // onSaved: (newValue) => _password = newValue!,
              ),

              const SizedBox(height: 20.0), // Add spacing

              // Register button
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pushNamed("login");
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Implement register logic here (e.g., call an API)
                    // print('Username: $_username, Email: $_email, Password: $_password');

                    // Clear form or navigate to next step
                    // try {
                    //   final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    //     email: emailController.text,
                    //     password: passwordController.text,
                    //   );
                    //   Navigator.of(context).pushReplacementNamed('homepage');
                    // } on FirebaseAuthException catch (e) {
                    //   if (e.code == 'weak-password') {
                    //     print('The password provided is too weak.');
                    //   } else if (e.code == 'email-already-in-use') {
                    //     print('The account already exists for that email.');
                    //   }
                    // } catch (e) {
                    //   print(e);
                    // }
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50.0),
                  backgroundColor: Colors.blue[700],
                ),
                child: const Text(
                  'Register',
                  style: CustomTextStyle.buttonText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextStyle {
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
