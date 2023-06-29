import 'package:clinic_reservation/login_page.dart';
import 'package:flutter/material.dart';
import 'package:clinic_reservation/home_page.dart';

class SettingsPage extends StatelessWidget {
  final String username;
  final String email;

  SettingsPage({required this.username, required this.email,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => AppointmentHomePage(
                  username: username,
                  email: email,
                ),
              ),
            );
          },
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Notification Settings'),
            subtitle: Text('Customize your notification preferences'),
          ),
          SwitchListTile(
            title: Text('Push Notifications'),
            subtitle: Text('Enable or disable push notifications'),
            value: true, // Replace with the actual value from preferences
            onChanged: (value) {
              // Update the value in preferences
            },
          ),
          SwitchListTile(
            title: Text('Sound Alerts'),
            subtitle: Text('Enable or disable sound alerts'),
            value: true, // Replace with the actual value from preferences
            onChanged: (value) {
              // Update the value in preferences
            },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(name: 'name', email: 'email', password: 'password'),
                ),
              );
            },
            child: Text('Logout'),
          ),
          // Add more settings here as needed
        ],
      ),
    );
  }
}
