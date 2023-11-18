import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: (size.width > 1000) ? size.height * 0.07 : null,
      color: Colors.black,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          LinkText(
            text: 'About',
          ),
          LinkText(
            text: 'Help Center',
          ),
          LinkText(
            text: 'Term of Services',
          ),
          LinkText(
            text: 'Privacity Policy',
          ),
          LinkText(
            text: 'Ads info',
          ),
          LinkText(
            text: 'Blog',
          ),
          LinkText(
            text: 'Status',
          ),
          LinkText(
            text: 'Careets',
          ),
          LinkText(
            text: 'Brand Resurces',
          ),
          LinkText(
            text: 'Advertiding',
          ),
          LinkText(
            text: 'Marketing',
          ),
        ],
      ),
    );
  }
}
