import 'package:flutter/material.dart';
import 'package:practica_formularios/controllers/ContactController.dart';
import 'package:practica_formularios/views/ListContactPage.dart';

class CreateContactPage extends StatelessWidget {
  String title = "Crear contacto";
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: formContact(context),
    );
  }

  Form formContact(BuildContext context) {
    return Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextFormField(
                validator: validateField,
                decoration: const InputDecoration(
                  labelText: "Nombre",
                  hintText: "Ingrese el nombre",
                ),
              ),
              TextFormField(
                validator: validateField,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Celular",
                  hintText: "Ingrese su número celular",
                ),
              ),
              ElevatedButton(
                child: const Text("Guardar"),
                onPressed: () => saveContact(_key),
              ),
            ],
          ),
        ));
  }
}
