import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:admin_dashboard/models/htpp/auth_response.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notification_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
}

class AuthProvider extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(String email, String password) {
    final data = {
      'correo': email,
      'password': password,
    };
    print(data);

    ApiCafe.post('/auth/login', data).then((json) {
      print(json);
      final authResponse = AuthResponse.fromJson(json);
      user = authResponse.usuario;
      LocalStorenge.pref.setString('token', authResponse.token);
      this.authStatus = AuthStatus.authenticated;
      notifyListeners();
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      ApiCafe.configureDio();
    }).catchError((e) {
      print(e);
      NotificationService.showSnackbarError("Error al registrar usuario");
    });
  }

  register(
      {required String email, required String password, required String name}) {
    final data = {
      'nombre': name,
      'correo': email,
      'password': password,
    };
    print(data);

    ApiCafe.post('/usuarios', data).then((json) {
      print(json);
      final authResponse = AuthResponse.fromJson(json);
      user = authResponse.usuario;
      LocalStorenge.pref.setString('token', authResponse.token);
      this.authStatus = AuthStatus.authenticated;
      ApiCafe.configureDio();
      notifyListeners();
    }).catchError((e) {
      print(e);
      NotificationService.showSnackbarError("Error al registrar usuario");
    });

    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorenge.pref.getString('token');
    if (token == null) {
      this.authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    try {
      final resp = await ApiCafe.httpGet('/auth');
      final authResponse = AuthResponse.fromJson(resp);
      this.user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      ApiCafe.configureDio();
      return true;
    } catch (e) {
      print(e);
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
    }

    return false;
  }

  logout() {
    LocalStorenge.pref.remove('token');
    this.authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}
