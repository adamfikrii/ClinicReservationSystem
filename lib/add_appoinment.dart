import 'package:flutter/material.dart';

class Appointment {
  int id;
  Customer customer;
  Doctor doctor;
  DateTime dateTime;

  Appointment({required this.id, required this.customer, required this.doctor, required this.dateTime});
}

class Customer {
  String name;
  String phoneNumber;
  int age;
  String address;

  Customer({required this.name, required this.phoneNumber, required this.age, required this.address});
}

class Doctor {
  String name;
  String specialization;
  String clinic;

  Doctor({required this.name, required this.specialization, required this.clinic});
}

class AddAppointmentPage extends StatefulWidget {
  @override
  _AddAppointmentPageState createState() => _AddAppointmentPageState();
}

class _AddAppointmentPageState extends State<AddAppointmentPage> {
  TextEditingController _customerNameController = TextEditingController();
  TextEditingController _customerPhoneController = TextEditingController();
  TextEditingController _customerAgeController = TextEditingController();
  TextEditingController _customerAddressController = TextEditingController();
  TextEditingController _doctorNameController = TextEditingController();
  TextEditingController _doctorSpecializationController = TextEditingController();
  TextEditingController _doctorClinicController = TextEditingController();
  DateTime? _selectedDateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Appointment'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _customerNameController,
              decoration: InputDecoration(labelText: 'Customer Name'),
            ),
            TextField(
              controller: _customerPhoneController,
              decoration: InputDecoration(labelText: 'Customer Phone'),
            ),
            TextField(
              controller: _customerAgeController,
              decoration: InputDecoration(labelText: 'Customer Age'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _customerAddressController,
              decoration: InputDecoration(labelText: 'Customer Address'),
            ),
            TextField(
              controller: _doctorNameController,
              decoration: InputDecoration(labelText: 'Doctor Name'),
            ),
            TextField(
              controller: _doctorSpecializationController,
              decoration: InputDecoration(labelText: 'Doctor Specialization'),
            ),
            TextField(
              controller: _doctorClinicController,
              decoration: InputDecoration(labelText: 'Doctor Clinic'),
            ),
            IconButton(
              onPressed: () async {
                // Show a date picker to select the appointment date and time
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                );

                if (selectedDate != null) {
                  // Show a time picker to select the appointment time
                  TimeOfDay? selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (selectedTime != null) {
                    setState(() {
                      _selectedDateTime = DateTime(
                        selectedDate.year,
                        selectedDate.month,
                        selectedDate.day,
                        selectedTime.hour,
                        selectedTime.minute,
                      );
                    });
                  }
                }
              },
              icon: Icon(Icons.date_range),
              iconSize: 30.0,// or Icon(Icons.access_time),
            ),
            ElevatedButton(
              onPressed: () {
                // Create the customer and doctor objects
                Customer customer = Customer(
                  name: _customerNameController.text,
                  phoneNumber: _customerPhoneController.text,
                  age: int.tryParse(_customerAgeController.text) ?? 0,
                  address: _customerAddressController.text,
                );

                Doctor doctor = Doctor(
                  name: _doctorNameController.text,
                  specialization: _doctorSpecializationController.text,
                  clinic: _doctorClinicController.text,
                );

                // Create a new appointment object and pass it back to the previous screen
                if (customer.name.isNotEmpty &&
                    customer.phoneNumber.isNotEmpty &&
                    customer.age > 0 &&
                    customer.address.isNotEmpty &&
                    doctor.name.isNotEmpty &&
                    doctor.specialization.isNotEmpty &&
                    doctor.clinic.isNotEmpty &&
                    _selectedDateTime != null) {
                  Appointment newAppointment = Appointment(
                    id: DateTime.now().microsecondsSinceEpoch,
                    customer: customer,
                    doctor: doctor,
                    dateTime: _selectedDateTime!,
                  );
                  Navigator.pop(context, newAppointment);
                }
              },
              child: Text('Save Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}