import 'package:flutter/material.dart';

class LEDBulb extends StatelessWidget {
  final double screenWidth, screenHeight;
  final Color onColor, offColor;
  final bool isSwitchingOn;
  final animationDuration = const Duration(milliseconds: 1800);

  const LEDBulb({
    Key key,
    @required this.screenWidth,
    @required this.screenHeight,
    @required this.onColor,
    @required this.offColor,
    @required this.isSwitchingOn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: screenHeight * .38,
        left: screenWidth * 0.099,
        child: AnimatedContainer(
          duration: animationDuration,
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: isSwitchingOn ? onColor : offColor,
            shape: BoxShape.circle,
          ),
        ));
  }
}
