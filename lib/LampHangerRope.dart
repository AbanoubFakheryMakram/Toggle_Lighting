import 'package:flutter/material.dart';

// The hand of bulb
class LampHangerRope extends StatelessWidget {
  final screenWidth, screeHeight, color;

  const LampHangerRope(
      {Key key,
      @required this.screenWidth,
      @required this.screeHeight,
      @required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: screenWidth * 0.2,
      child: Container(
        color: color,
        width: 15,
        height: screeHeight * 0.22,
      ),
    );
  }
}
