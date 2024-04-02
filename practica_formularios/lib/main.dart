import 'package:flutter/material.dart';
import 'package:practica_formularios/models/Contact.dart';
import 'package:practica_formularios/views/CreateContactPage.dart';
import 'package:practica_formularios/views/ListContactPage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final List<Contact> contacts = [
    Contact(name: 'Juan', phoneNumber: '1234567890'),
    Contact(name: 'María', phoneNumber: '0987654321'),
    Contact(name: 'Pedro', phoneNumber: '1111111111'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListContactPage(contacts: contacts),
    );
  }
}
