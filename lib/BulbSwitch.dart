import 'package:flutter/material.dart';

class LampSwitch extends StatelessWidget {
  final double screenHeight, screenWidth;
  final bool isSwitchingOn;
  final Color onColor, offColor, color;
  final Duration animationDuration;
  final Function onTap;

  const LampSwitch(
      {Key key,
      @required this.screenHeight,
      @required this.screenWidth,
      @required this.isSwitchingOn,
      @required this.onColor,
      @required this.offColor,
      this.color,
      this.animationDuration,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: screenHeight * .30,
        width: 30,
        left: screenWidth * .45,
        child: GestureDetector(
          onTap: onTap,
          child: Stack(
            children: <Widget>[
              AnimatedContainer(
                duration: animationDuration,
                width: 30,
                height: 70,
                decoration: BoxDecoration(
                  color: isSwitchingOn ? onColor : offColor,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              AnimatedPositioned(
                duration: animationDuration,
                left: 0,
                right: 0,
                top: isSwitchingOn ? 42 : 4,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
