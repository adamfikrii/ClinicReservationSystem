import 'package:clinic_reservation/doctor_profile.dart';
import 'package:flutter/material.dart';
import 'package:clinic_reservation/add_appoinment.dart';
import 'package:clinic_reservation/profile_page.dart';
import 'package:clinic_reservation/setting_page.dart';

class AppointmentHomePage extends StatefulWidget {
  final String username;
  final String email;

  AppointmentHomePage({required this.username, required this.email});

  @override
  _AppointmentHomePageState createState() => _AppointmentHomePageState();
}

class _AppointmentHomePageState extends State<AppointmentHomePage> {
  List<Appointment> appointments = [];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    String username = widget.username;
    String email = widget.email;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.chat),
            onPressed: () {
              // Handle chatbox action
            },
          ),
        ],
        title: Text('Appointment Booking'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/clinic-2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: appointments.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(appointments[index].id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  appointments.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Appointment cancelled.'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              background: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 16.0),
                color: Colors.red,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    Text(
                      'Delete',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2.0,
                      blurRadius: 5.0,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(appointments[index].customer.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Phone: ${appointments[index].customer.phoneNumber}'),
                      SizedBox(height: 8.0),
                      Text('Doctor: ${appointments[index].doctor.name}'),
                      Text('Specialization: ${appointments[index].doctor.specialization}'),
                    ],
                  ),
                  trailing: InkWell(
                    onTap: () {
                      // Navigate to the doctor profile page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            if (appointments[index].doctor.name == 'Dr. John Doe') {
                              return DoctorProfilePage(
                                doctorName: 'Dr. John Doe',
                                specialization: 'Dermatology',
                                description: 'Dr. John Doe is a renowned dermatologist with expertise in skin-related conditions and treatments. He has been practicing for 15 years and has helped numerous patients achieve healthy and radiant skin.',
                              );
                            } else if (appointments[index].doctor.name == 'Dr. Jane Smith') {
                              return DoctorProfilePage(
                                doctorName: 'Dr. Jane Smith',
                                specialization: 'Pediatrics',
                                description: 'Dr. Jane Smith is a compassionate pediatrician who loves working with children and providing them with the best medical care. With her friendly demeanor and extensive knowledge, she ensures the well-being of her young patients.',
                              );
                            }
                            // Return a default doctor profile page or handle other cases
                            return DoctorProfilePage(
                              doctorName: 'Dr. Adam Fikri',
                              specialization: 'General Medicine',
                              description: 'Dr. Adam Fikri is a dedicated general physician with a passion for providing comprehensive medical care to patients of all ages. With his expertise in diagnosing and treating various health conditions, he aims to improve the overall well-being of his patients and promote a healthy lifestyle.',
                            );
                          },
                        ),
                      );
                    },
                    child: Icon(Icons.person),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the appointment booking screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddAppointmentPage(),
            ),
          ).then((newAppointment) {
            // Add the new appointment to the list
            if (newAppointment != null) {
              setState(() {
                appointments.add(newAppointment);
              });
            }
          });
        },
        backgroundColor: Colors.deepPurple[500], // Set the desired color here
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 1) {
            // Navigate to the profile page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage(username: username, email: email)),
            );
          } else if (index == 2) {
            // Navigate to the settings page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage(username: username, email: email)),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
