import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final Icon icon;
  // final String context;
  const RatingBar({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(1.floor(), (index) {
        return this.icon;
      }),
    );
  }
}
