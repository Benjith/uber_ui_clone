import 'package:flutter/material.dart';
import 'package:uberclone_ben/screens/help.dart';
import 'package:uberclone_ben/screens/location_reached.dart';
import 'package:uberclone_ben/screens/payment.dart';
import 'package:uberclone_ben/screens/your_trips.dart';

class Screens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screens'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LocationReached())),
              child: Text('Location Reached'),
            ),
              RaisedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => YourTrips())),
              child: Text('Your Trips'),
            ),
               RaisedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Payment())),
              child: Text('Payment'),
            ),
             RaisedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Help())),
              child: Text('Help'),
            ),
          ],
        ),
      ),
    );
  }
}
