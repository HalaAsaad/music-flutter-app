import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>(); // Key for form validation
  bool _showPassword = false; // For password visibility toggle

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  void register(String username, String password, String fname, String lastName,
      String email, String address) async {
    // Navigator.of(context).pushNamed("login"); // to delete when request succcess
    final url = Uri.parse(
        'https://amphibological-doze.000webhostapp.com/Register.php'); // Replace with your API endpoint
    final response = await http.post(
      url,
      // headers: {'Content-Type': 'application/json'},
      body: {
        'username': username,
        'password': password,
        'fname': fname,
        'lname': lastName,
        "email": email,
        "address": address
      },
    );
    void navigateToLogin() {
      if (!mounted) return; // Check if widget is still mounted
      Navigator.of(context).pushNamed("login");
    }

    if (response.statusCode == 200) {
      // Handle successful login (e.g., navigate to another page)
      navigateToLogin();
      // print('Login successful!');
    } else {
      // Handle login failure (e.g., show error message)
      // print('Login failed: ${response.statusCode}');
      // Show an appropriate error message to the user
    }
  }

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
                controller: usernameController,
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
              ),
              const SizedBox(height: 20.0), // Add spacing
              // FName field
              TextFormField(
                controller: firstNameController,
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
              ),

              const SizedBox(height: 20.0), // Add spacing
              // LName field
              TextFormField(
                controller: lastNameController,
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
              ),
              const SizedBox(height: 20.0), // Add spacing
              // Address field
              TextFormField(
                controller: addressController,
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
              ),
              const SizedBox(height: 20.0), // Add spacing
              // Email field
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress, // Set keyboard type
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email address';
                  } else if (!RegExp(r"\S+@\S+\.\S+").hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null; // Return null for valid input
                },
              ),
              const SizedBox(height: 20.0), // Add spacing
              // Password field
              TextFormField(
                controller: passwordController,
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
                obscureText: !_showPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null; // Return null for valid input (consider complexity rules)
                },
              ),
              const SizedBox(height: 20.0), // Add spacing
              // Register button
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    register(
                        usernameController.text.toString(),
                        passwordController.text.toString(),
                        firstNameController.text.toString(),
                        lastNameController.text.toString(),
                        emailController.text.toString(),
                        addressController.text.toString());
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
