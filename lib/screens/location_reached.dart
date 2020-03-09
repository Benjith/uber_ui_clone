import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LocationReached extends StatefulWidget {
  @override
  _LocationReachedState createState() => _LocationReachedState();
}

class _LocationReachedState extends State<LocationReached> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlareActor("assets/Searching.flr",
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: "Untitled"),
    );
  }
}
