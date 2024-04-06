import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // Key for form validation

  bool _showPassword = false; // Add this line to define the state variable
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.blue[700], // Set app bar color
        centerTitle: true, // Center app bar title
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center form vertically
            crossAxisAlignment:
                CrossAxisAlignment.stretch, // Stretch form horizontally
            children: [
              const SizedBox(height: 40.0), // Add some top padding
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[700], // Set welcome text color
                ),
              ),
              const SizedBox(height: 20.0), // Add spacing
              //Login Button
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                        10.0), // Rounded corners for input fields
                  ),
                ),
                // controller:email,
                controller: emailController,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null; // Return null for valid input
                },
                // onSaved: (newValue) => _username = newValue!,
              ),
              const SizedBox(height: 20.0), // Add spacing
              //password
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: IconButton(
                    // IconButton for better interactivity
                    icon: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility,
                    ), // Toggle icon based on _showPassword state
                    onPressed: () =>
                        setState(() => _showPassword = !_showPassword),
                  ),
                ),
                controller: passwordController,
                obscureText: !_showPassword, // Hide password characters
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null; // Return null for valid input
                },
                // onSaved: (newValue) => _password = newValue!,
              ),
              const SizedBox(height: 20.0), // Add spacing
              //login button
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pushNamed("home");
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(
                      double.infinity, 50.0), // Set minimum button size
                  backgroundColor: Colors.blue[700], // Set button color
                ),
                child: const Text(
                  'Login',
                  style: CustomTextStyle.buttonText,
                ),
              ),

              const SizedBox(height: 15.0), // Adjust spacing

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
    ));
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
