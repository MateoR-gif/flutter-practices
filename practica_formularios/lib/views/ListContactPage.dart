import 'package:flutter/material.dart';
import 'package:practica_formularios/models/Contact.dart';

class ListContactPage extends StatelessWidget{
  final List<Contact> contacts;
  ListContactPage({required this.contacts});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contactos'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index].name),
            subtitle: Text(contacts[index].phoneNumber),
          );
        },
      ),
    );
  }
}