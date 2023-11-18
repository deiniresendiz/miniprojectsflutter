import 'package:flutter/material.dart';

class RegsiterFromProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String name = '';

  validateFrom() {
    formKey.currentState!.validate();
  }
}
