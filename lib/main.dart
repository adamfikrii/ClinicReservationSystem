import 'package:clinic_reservation/add_appoinment.dart';
import 'package:flutter/material.dart';
import 'package:clinic_reservation/home_page.dart';
import 'package:clinic_reservation/setting_page.dart';
import 'package:clinic_reservation/profile_page.dart';
import 'package:clinic_reservation/login_page.dart';


void main() {
  runApp(AppointmentBookingApp());
}

class AppointmentBookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appointment Booking',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: {
        '/appointmentHomePage': (context) => AppointmentHomePage(
          username: 'your_username',
          email: 'your_email',
        ),
        '/settings': (context) => SettingsPage(
          username: 'username',
          email: 'email',
        ),
        '/profile': (context) => ProfilePage(
          username: 'username',
          email: 'email',
        ),
        '/addAppointment': (context) => AddAppointmentPage(),
      },
      home: LoginPage(name: 'name', email: 'email', password: 'password'),
    );
  }
}
