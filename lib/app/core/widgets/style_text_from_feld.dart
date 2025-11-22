import 'package:flutter/material.dart';

class StyleTextFromFeld extends StatelessWidget {
  const StyleTextFromFeld({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
            decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              
            ),
    );
  }
}