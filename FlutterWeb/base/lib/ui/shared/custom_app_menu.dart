import 'package:base/locator.dart';
import 'package:base/services/navigation_service.dart';
import 'package:base/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return (constraints.maxWidth > 520)
            ? const _TableDesktopMenu()
            : const _MobileMenu();
      },
    );
  }
}

class _TableDesktopMenu extends StatelessWidget {
  const _TableDesktopMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Row(
        children: [
          CustomFlatButton(
            //onPressed: () => Navigator.pushNamed(context, '/sateful'),
            onPressed: () =>
                locator<NavagationService>().navigateTo('/sateful'),
            text: 'Contador Stateful',
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            onPressed: () =>
                locator<NavagationService>().navigateTo('/provider'),
            text: 'Contador Provider',
            color: Colors.black,
          ),
          CustomFlatButton(
            onPressed: () =>
                locator<NavagationService>().navigateTo('/other-page'),
            text: 'Otra pagina',
            color: Colors.black,
          ),
          CustomFlatButton(
            //onPressed: () => Navigator.pushNamed(context, '/sateful'),
            onPressed: () =>
                locator<NavagationService>().navigateTo('/sateful/100'),
            text: 'Stateful 100',
            color: Colors.black,
          ),
          CustomFlatButton(
            onPressed: () =>
                locator<NavagationService>().navigateTo('/provider?q=200'),
            text: 'Provider 200',
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

class _MobileMenu extends StatelessWidget {
  const _MobileMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFlatButton(
            //onPressed: () => Navigator.pushNamed(context, '/sateful'),
            onPressed: () =>
                locator<NavagationService>().navigateTo('/sateful'),
            text: 'Contador Stateful',
            color: Colors.black,
          ),
          const SizedBox(width: 10),
          CustomFlatButton(
            onPressed: () =>
                locator<NavagationService>().navigateTo('/provider'),
            text: 'Contador Provider',
            color: Colors.black,
          ),
          CustomFlatButton(
            onPressed: () =>
                locator<NavagationService>().navigateTo('/other-page'),
            text: 'Otra pagina',
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
