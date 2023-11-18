import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_from_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_input.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => LoginFromProvider(),
      child: Builder(builder: (context) {
        final loginFromProvider =
            Provider.of<LoginFromProvider>(context, listen: false);
        return Container(
          margin: EdgeInsets.only(top: 100),
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Colors.black,
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 370),
              child: Form(
                  key: loginFromProvider.formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
                      //Email
                      TextFormField(
                        onChanged: (value) => loginFromProvider.email = value,
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? '')) {
                            return 'Please enter the email';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInput.CustomInputDecoration(
                            hint: 'Ingrese su correo',
                            label: 'Email',
                            icon: Icons.email_outlined),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        onChanged: (value) =>
                            loginFromProvider.password = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the password';
                          }
                          return null;
                        },
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInput.CustomInputDecoration(
                            hint: '*********',
                            label: 'Ingrese su password',
                            icon: Icons.lock_clock_rounded),
                      ),
                      SizedBox(height: 20),
                      CustomOutlinedButton(
                        text: 'Ingresar',
                        onPressed: () {
                          final isValid = loginFromProvider.validateFrom();
                          if (isValid) {
                            authProvider.login(loginFromProvider.email,
                                loginFromProvider.password);
                          }
                          print('Ingresando...');
                        },
                      ),

                      SizedBox(height: 20),
                      LinkText(
                          text: 'Nueva Cuenta',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Flurorouter.registerRoute);
                          }),
                    ],
                  )),
            ),
          ),
        );
      }),
    );
  }
}
