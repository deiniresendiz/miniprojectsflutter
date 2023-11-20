import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      physics: ClampingScrollPhysics(),
      children: [
        Text(
          'Icons',
          style: CustomLabels.h1,
        ),
        SizedBox(
          height: 10,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          children: [
            WhiteCard(
              text: 'add_a_photo',
              child: Icon(Icons.add_a_photo),
              width: 170,
            ),
            WhiteCard(
              text: 'access_alarm_rounded',
              child: Icon(Icons.access_alarm_rounded),
              width: 170,
            ),
            WhiteCard(
              text: 'add_business_rounded',
              child: Icon(Icons.add_business_rounded),
              width: 170,
            ),
            WhiteCard(
              text: 'add_alarm_rounded',
              child: Icon(Icons.add_alarm_rounded),
              width: 170,
            ),
            WhiteCard(
              text: 'dangerous',
              child: Icon(Icons.dangerous),
              width: 170,
            ),
            WhiteCard(
              text: 'abc',
              child: Icon(Icons.abc),
              width: 170,
            ),
            WhiteCard(
              text: 'show_chart_rounded',
              child: Icon(Icons.show_chart_rounded),
              width: 170,
            ),
            WhiteCard(
              text: 'tab',
              child: Icon(Icons.tab),
              width: 170,
            ),
            WhiteCard(
              text: 'safety_check',
              child: Icon(Icons.safety_check),
              width: 170,
            ),
          ],
        )
      ],
    ));
  }
}
