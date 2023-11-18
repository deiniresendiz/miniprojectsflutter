import 'package:admin_dashboard/providers/register_from_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_input.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegsiterFromProvider(),
      child: Builder(builder: (context) {
        final registerFromProvider =
            Provider.of<RegsiterFromProvider>(context, listen: false);
        return Container(
          margin: EdgeInsets.only(top: 50),
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Colors.black,
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 370),
              child: Form(
                  key: registerFromProvider.formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
                      //Nombre
                      TextFormField(
                        onChanged: (value) => registerFromProvider.name = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the name';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInput.CustomInputDecoration(
                            hint: 'Ingrese su nombre',
                            label: 'Nombre',
                            icon: Icons.email_outlined),
                      ),
                      SizedBox(height: 20),
                      //Email
                      TextFormField(
                        onChanged: (value) =>
                            registerFromProvider.email = value,
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
                      SizedBox(height: 19),
                      TextFormField(
                        onChanged: (value) =>
                            registerFromProvider.password = value,
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
                      SizedBox(height: 19),

                      CustomOutlinedButton(
                        text: 'Crear Cuenta',
                        onPressed: () {
                          registerFromProvider.validateFrom();
                          print('Creando cuenta...');
                        },
                      ),

                      SizedBox(height: 20),
                      LinkText(
                          text: 'Ir a login',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Flurorouter.loginRoute);
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
