import 'package:flutter/material.dart';
import 'package:switch_bulb/BulbSwitch.dart';

import 'LEDBulb.dart';
import 'Lamp.dart';
import 'LampHangerRope.dart';
import 'LampSwitchRope.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp(),
      ),
    );

final Color darkGrey = Color(0xff232323);
final Color bulbOnColor = Color(0xffffe12c);
final Color bulbOffColor = Color(0xffc1c1c1);
final Color gradientColor = Color(0xfffdf3b0);
final Duration animationDuration = Duration(milliseconds: 500);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool lightingLamp;

  @override
  void initState() {
    super.initState();
    lightingLamp = false;
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          // the hand of the bulb
          LampHangerRope(
            screeHeight: screenHeight,
            screenWidth: screenWidth,
            color: darkGrey,
          ),
          // the actual bulb
          LEDBulb(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              onColor: bulbOnColor,
              offColor: bulbOffColor,
              isSwitchingOn: lightingLamp),
          // the cover and light
          Lamp(
            animationDuration: animationDuration,
            screeHeight: screenHeight,
            screenWidth: screenWidth,
            color: darkGrey,
            isSwitchingOn: lightingLamp,
            gradientColor: gradientColor,
          ),
          LampSwitch(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            color: darkGrey,
            isSwitchingOn: lightingLamp,
            offColor: bulbOffColor,
            onTap: () {
              setState(() {
                lightingLamp = !lightingLamp;
              });
            },
            animationDuration: animationDuration,
            onColor: bulbOnColor,
          ),
          LampSwitchRope(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
            color: darkGrey,
            isSwitchingOn: lightingLamp,
            offColor: bulbOffColor,
            animationDuration: animationDuration,
            onColor: bulbOnColor,
          ),
          Positioned(
            bottom: 40,
            left: screenWidth * .45,
            child: RotatedBox(
                quarterTurns: 1,
                child: AnimatedDefaultTextStyle(
                  duration: animationDuration,
                  child: Text(
                    'Switching ${lightingLamp ? 'on' : 'off'}',
                  ),
                  style: TextStyle(
                      fontSize: 21,
                      color: lightingLamp ? Colors.black : Colors.grey),
                )),
          ),
        ],
      ),
    );
  }
}
