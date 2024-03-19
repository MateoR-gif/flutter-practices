import 'package:flutter/material.dart';
import '../password_generator.dart';

class PasswordGeneratorWidget extends StatefulWidget {
  @override
  _PasswordGeneratorWidgetState createState() => _PasswordGeneratorWidgetState();
}

class _PasswordGeneratorWidgetState extends State<PasswordGeneratorWidget> {
  int _passwordLength = 8;
  bool _useUpperCase = true;
  bool _useLowerCase = true;
  bool _useNumbers = true;
  bool _useSymbols = true;
  String _password = '';

  void _generatePassword() {
    setState(() {
      _password = PasswordGenerator.generatePassword(
        length: _passwordLength,
        useUpperCase: _useUpperCase,
        useLowerCase: _useLowerCase,
        useNumbers: _useNumbers,
        useSymbols: _useSymbols,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Largo de la contraseña:',
            style: TextStyle(fontSize: 18.0),
          ),
          Slider(
            value: _passwordLength.toDouble(),
            min: 6,
            max: 20,
            divisions: 14,
            onChanged: (newValue) {
              setState(() {
                _passwordLength = newValue.round();
              });
            },
          ),
          Text(
            '$_passwordLength',
            style: TextStyle(fontSize: 18.0),
          ),
          CheckboxListTile(
            title: Text('Usar mayúsculas: '),
            value: _useUpperCase,
            onChanged: (value) {
              setState(() {
                _useUpperCase = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Usar minúsculas: '),
            value: _useLowerCase,
            onChanged: (value) {
              setState(() {
                _useLowerCase = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Usar números: '),
            value: _useNumbers,
            onChanged: (value) {
              setState(() {
                _useNumbers = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Usar símbolos'),
            value: _useSymbols,
            onChanged: (value) {
              setState(() {
                _useSymbols = value!;
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _generatePassword,
            child: Text('Generar Contraseña'),
          ),
          SizedBox(height: 20),
          Text(
            'Contraseña Generada: ',
            style: TextStyle(fontSize: 18.0),
          ),
          Text(
            _password,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}