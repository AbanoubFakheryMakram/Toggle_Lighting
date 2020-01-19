import 'package:flutter/material.dart';

class Lamp extends StatelessWidget {
  final double screenWidth, screeHeight;
  final Color color, gradientColor;
  final bool isSwitchingOn;
  final Duration animationDuration;

  const Lamp(
      {Key key,
      @required this.screenWidth,
      @required this.screeHeight,
      @required this.color,
      @required this.isSwitchingOn,
      @required this.gradientColor,
      @required this.animationDuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -screenWidth * .95,
      top: screeHeight * .22,
      width: screenWidth * 2.1,
      child: ClipPath(
        clipper: MyClipper(),
        child: Column(
          children: <Widget>[
            Container(
              height: screeHeight * 0.25,
              color: color,
            ),
            AnimatedContainer(
              duration: animationDuration,
              height: screeHeight * 0.75,
              decoration: BoxDecoration(
                gradient: isSwitchingOn
                    ? LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          gradientColor.withOpacity(.7),
                          gradientColor.withOpacity(.1),
                        ],
                      )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.3, 0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * 0.7, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
