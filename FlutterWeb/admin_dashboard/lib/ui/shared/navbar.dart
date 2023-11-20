import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:admin_dashboard/ui/shared/widgets/navbar_avatar.dart';
import 'package:admin_dashboard/ui/shared/widgets/notification_indicator.dart';
import 'package:admin_dashboard/ui/shared/widgets/search_text.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildDecoration(),
      child: Row(children: [
        if (size.width <= 700)
          IconButton(
            icon: Icon(Icons.menu_outlined),
            onPressed: () {
              SideMenuProvider.openMenu();
            },
          ),
        SizedBox(
          width: 5,
        ),
        if (size.width > 390)
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 250),
            child: SearchText(),
          ),
        Spacer(),
        NotificationIndicator(),
        SizedBox(
          width: 10,
        ),
        NavbarAvatar(),
        SizedBox(
          width: 10,
        ),
      ]),
    );
  }

  BoxDecoration buildDecoration() => BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]);
}
