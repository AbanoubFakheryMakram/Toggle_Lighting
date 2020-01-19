import 'package:flutter/material.dart';

class LampSwitchRope extends StatelessWidget {
  final double screenHeight, screenWidth;
  final bool isSwitchingOn;
  final Color onColor, offColor, color;
  final Duration animationDuration;

  const LampSwitchRope(
      {Key key,
      @required this.screenHeight,
      @required this.screenWidth,
      @required this.isSwitchingOn,
      @required this.onColor,
      @required this.offColor,
      this.color,
      this.animationDuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: animationDuration,
      top: screenHeight * .4,
      bottom: screenHeight * (isSwitchingOn ? .32 : .38),
      left: screenWidth * .490, //  490
      width: 2,
      child: Container(
        color: color,
      ),
    );
  }
}
