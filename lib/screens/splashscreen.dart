import 'package:flutter/material.dart';
import 'package:tarantar/tools/functions.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    initOneSignal();
  }

  initOneSignal() async {
    await Future.delayed(Duration(seconds: 1));
    customNavigator(context, "login");
  }

  Widget build(BuildContext context) {    
    double mediaWidth = MediaQuery.of(context).size.width;
    double mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: InkWell(
        child: Container(
          width: mediaWidth,
          height: mediaHeight,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Image.asset(
                      getAssetImages("tagline.png"),
                      width: mediaWidth * 0.6,
                    )
                  ),
                ],
              ),
            )
          )
        ),
      ),
    );
  }
}