import 'package:clinic_reservation/home_page.dart';
import 'package:clinic_reservation/sign_up.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String name;
  final String email;
  final String password;

  LoginPage({required this.name, required this.email, required this.password});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set the initial values of the email and password text fields
    _emailController.text = widget.email;
    _passwordController.text = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/clinic-1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () async {
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  try {
                    // Perform your authentication logic here
                    // ...

                    // Login successful, navigate to the desired screen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => AppointmentHomePage(
                          username: email,
                          email: email,
                        ),
                      ),
                    );
                  } catch (e) {
                    // Handle any login errors
                    print(e.toString());
                  }
                },
                child: Text('Login'),
              ),
              SizedBox(height: 6.0),
              Text("Don't have any account?"),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => SignUpPage(),
                    ),
                  );
                },
                child: Text('Create an account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
