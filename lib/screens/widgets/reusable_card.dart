import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  const ReusableContainer(
      {super.key,
      required this.color,
      this.cardChild,
      this.onTap,
      this.flex = 1});
  final Color color;
  final Widget? cardChild;
  final Function()? onTap;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
          child: cardChild,
        ),
      ),
    );
  }
}
