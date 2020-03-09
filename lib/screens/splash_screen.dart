import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uberclone_ben/screens/dashboard.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _height = 1.0;
  double _width = 1.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)=>Future.delayed(Duration(seconds: 3),(){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashboard()));
    }));
  }

  route(context, hight, width) {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _height = hight;
        _width = width;
        _borderRadius = BorderRadius.circular(_height == hight ? 2 : 50);
      });
    });
  
  }

  btnClicke() {}

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(50);
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);

    final deviceH = MediaQuery.of(context).size.height;
    final deviceW = MediaQuery.of(context).size.height;
    route(context, deviceH, deviceW);
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            Container(
              child: Center(
                child: Text(
                  'Uber',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 72.0,
                      fontFamily: 'Maven',
                      fontWeight: FontWeight.w500),
                ),
              ),
              height: double.infinity,
              width: double.infinity,
            ),
            Center(
              child: AnimatedContainer(
                constraints: BoxConstraints(minHeight: 1.0, minWidth: 1.0),
                curve: Curves.easeInToLinear,
                duration: Duration(milliseconds: 700),
                height: _height,
                width: _width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: _borderRadius,
                ),
              ),
            ),
          ],
        ));
  }
}
