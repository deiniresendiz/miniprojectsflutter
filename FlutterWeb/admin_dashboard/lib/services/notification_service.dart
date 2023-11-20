import 'package:flutter/material.dart';

class NotificationService {
  static GlobalKey<ScaffoldMessengerState> messangerKey =
      new GlobalKey<ScaffoldMessengerState>();

  static showSnackbarError(String message) {
    final snackBar = new SnackBar(
      backgroundColor: Colors.red.withOpacity(0.9),
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );

    messangerKey.currentState!.showSnackBar(snackBar);
  }
}
