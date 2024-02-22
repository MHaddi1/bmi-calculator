import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({super.key, required this.faIcon, required this.text});

  final IconData faIcon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          faIcon,
          size: 80,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: kTextLabelStyle,
        )
      ],
    );
  }
}
