import 'package:flutter/material.dart';
import 'package:password_generator/widgets/password_generator_widget.dart';


class PasswordOptionsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PasswordOptionsWidget();
  }
  
}

class _PasswordOptionsWidget extends State<PasswordOptionsWidget> {
  int _passwordLength = 8;
  bool _useUpperCase = true;
  bool _useLowerCase = true;
  bool _useNumbers = true;
  bool _useSymbols = true;
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          title: Text('Use Uppercase'),
          value: _useUpperCase,
          onChanged: (value) {
            setState(() {
              _useUpperCase = value!;
            });
          },
        ),
        CheckboxListTile(
          title: Text('Use Lowercase'),
          value: _useLowerCase,
          onChanged: (value) {
            setState(() {
              _useLowerCase = value!;
            });
          },
        ),
        CheckboxListTile(
          title: Text('Use Numbers'),
          value: _useNumbers,
          onChanged: (value) {
            setState(() {
              _useNumbers = value!;
            });
          },
        ),
        CheckboxListTile(
          title: Text('Use Symbols'),
          value: _useSymbols,
          onChanged: (value) {
            setState(() {
              _useSymbols = value!;
            });
          },
        ),
      ],
    );
  }
}
