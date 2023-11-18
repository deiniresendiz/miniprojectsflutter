import 'package:flutter/material.dart';

class LoginFromProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  validateFrom() {
    if (formKey.currentState!.validate()) {
      print('Formulario valido');
      return true;
    } else {
      print('Formulario no valido');
      return false;
    }
  }
}
