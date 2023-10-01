import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';
import 'package:vertical_landing_page/ui/shared/custom_menu_item.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({super.key});

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            _controller.reverse();
          } else {
            _controller.forward();
          }
          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          width: 150,
          height: isOpen ? 308 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, controller: _controller),
              if (isOpen) ...[
                CustomMenuItem(
                  text: 'Home',
                  onPressed: () => pageProvider.goTo(0),
                ),
                CustomMenuItem(
                  text: 'About',
                  onPressed: () => pageProvider.goTo(1),
                ),
                CustomMenuItem(
                  text: 'Pricing',
                  onPressed: () => pageProvider.goTo(2),
                ),
                CustomMenuItem(
                  text: 'Contract',
                  onPressed: () => pageProvider.goTo(3),
                ),
                CustomMenuItem(
                  text: 'Location',
                  onPressed: () => pageProvider.goTo(4),
                ),
                SizedBox(height: 8),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    super.key,
    required this.isOpen,
    required AnimationController controller,
  }) : _controller = controller;

  final bool isOpen;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 45 : 0,
          ),
          Text(
            'Menu',
            style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
          ),
          const Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _controller,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
