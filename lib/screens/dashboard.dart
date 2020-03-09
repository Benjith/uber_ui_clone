import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:uberclone_ben/screens/location_reached.dart';
import 'package:uberclone_ben/screens/screens.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  GlobalKey<ScaffoldState> _scafoldKey = GlobalKey();
  final double CAMERA_ZOOM = 16;
  final double CAMERA_TILT = 80;
  final double CAMERA_BEARING = 30;
  final LatLng SOURCE_LOCATION = LatLng(42.747932, -71.167889);
  LatLng DEST_LOCATION = LatLng(37.335685, -122.0605916);

  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();
// for my drawn routes on the map
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints;
  String googleAPIKey = "AIzaSyAl94Ny5NNazeIpGGCG0DdCfDYR59GWKQ8";
// for my custom marker pins
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
// the user's initial location and current location
// as it moves
  LocationData currentLocation;
// a reference to the destination location
  LocationData destinationLocation;
// wrapper around the location API
  Location location = Location();
  @override
  void initState() {
    super.initState();

    // create an instance of Location
    location = new Location();
    polylinePoints = PolylinePoints();

    // subscribe to changes in the user's location
    // by "listening" to the location's onLocationChanged event
    location.onLocationChanged().listen((LocationData cLoc) {
      // cLoc contains the lat and long of the
      // current user's position in real time,
      // so we're holding on to it
      currentLocation = cLoc;
      updatePinOnMap(context);
      if (currentLocation.latitude == destinationLocation.latitude &&
          currentLocation.longitude == destinationLocation.longitude) {
        // rider reached location
        // alert rider
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LocationReached()));
      }
    });
    // set custom marker pins
    setSourceAndDestinationIcons();
    // set the initial location
    setInitialLocation();
  }

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'assets/driving_pin.png');

    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/destination_map_marker.png');
  }

  void setInitialLocation() async {
    // set the initial location by pulling the user's
    // current location from the location's getLocation()
    currentLocation = await location.getLocation();

    // hard-coded destination for this example
    destinationLocation = LocationData.fromMap({
      "latitude": DEST_LOCATION.latitude,
      "longitude": DEST_LOCATION.longitude
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceH = MediaQuery.of(context).size.height;
    final deviceW = MediaQuery.of(context).size.height;
    TextStyle _drawerSubMenuStyle = TextStyle(
        fontFamily: 'Maven', fontWeight: FontWeight.w400, fontSize: 22.0);
    // SystemChrome.setEnabledSystemUIOverlays([]);
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values) ;

    CameraPosition initialCameraPosition = CameraPosition(
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: SOURCE_LOCATION);
    if (currentLocation != null) {
      initialCameraPosition = CameraPosition(
          target: LatLng(currentLocation.latitude, currentLocation.longitude),
          zoom: CAMERA_ZOOM,
          tilt: CAMERA_TILT,
          bearing: CAMERA_BEARING);
    }

    return Scaffold(
      key: _scafoldKey,
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            CircleAvatar(
                              radius: deviceH * 4 / 100,
                              backgroundColor: Colors.white70,
                              child: Icon(
                                Icons.person,
                                size: 38.0,
                                color: Colors.white54,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Benjith Kizhisseri',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontFamily: 'Maven',
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Divider(
                          color: Colors.white38,
                          height: 0.5,
                        ),
                        Text(
                          'Do more with your account',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w100),
                        ),
                        Text(
                          'Make money driving',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Your trips',
                      style: _drawerSubMenuStyle,
                    ),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Help',
                      style: _drawerSubMenuStyle,
                    ),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Wallet',
                      style: _drawerSubMenuStyle,
                    ),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Get discounts',
                      style: _drawerSubMenuStyle,
                    ),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Settings',
                      style: _drawerSubMenuStyle,
                    ),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Screens',
                      // style: _drawerSubMenuStyle,
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w100),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Screens()));
                    },
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Divider(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('  Legal'),
                      Text(
                        'v4.305.100001  ',
                        style: TextStyle(fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body:
          //body
          Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                // flex: 5,
                child: GoogleMap(
                    myLocationEnabled: true,
                    compassEnabled: true,
                    buildingsEnabled: false,
                    tiltGesturesEnabled: false,
                    markers: _markers,
                    polylines: _polylines,
                    mapType: MapType.normal,
                    initialCameraPosition: initialCameraPosition,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);

                      showPinsOnMap();
                    }),
              ),
              Container(
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: deviceH * 2 / 100,
                    ),
                    Text(
                      'Good evening Benjith',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Maven',
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: deviceH * 2 / 100,
                    ),
                    Divider(
                      thickness: 2.0,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: deviceW * 2 / 100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          TextField(
                            onSubmitted: (val) {
                              print(val);
                              if (val.contains(',')) {
                                destinationLocation = LocationData.fromMap({
                                  "latitude":
                                      double.tryParse(val.split(',').first),
                                  "longitude":
                                      double.tryParse(val.split(',').last)
                                });
                                setSourceAndDestinationIcons();
                                setInitialLocation();
                                setPolylines();
                                showPinsOnMap();
                              }
                            },
                            decoration: InputDecoration(
                                hintText: 'Where to?',
                                hintStyle: TextStyle(fontSize: 18.0),
                                fillColor: Colors.black12,
                                filled: true,
                                border: InputBorder.none),
                          ),
                          SizedBox(
                            height: deviceH * 1 / 100,
                          ),
                          FlatButton(
                            // onTap: () {},
                            onPressed: () {},
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: deviceH * 2 / 100,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          CircleAvatar(
                                            backgroundColor: Colors.black12,
                                            child: Icon(
                                              Icons.star,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            width: deviceW * 3 / 100,
                                          ),
                                          Text(
                                            'Choose a saved place',
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontFamily: 'Maven',
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Colors.black45,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: deviceH * 2 / 100,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          SafeArea(
              child: IconButton(
                  icon: Icon(Icons.menu),
                  iconSize: 32.0,
                  onPressed: () => _scafoldKey.currentState.isDrawerOpen == true
                      ? null
                      : _scafoldKey.currentState.openDrawer()))
        ],
      ),
    );
  }

  static final CameraPosition _ccj = CameraPosition(
    target: LatLng(11.1446454, 75.9452897),
    zoom: 14.4746,
  );
  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  void updatePinOnMap(BuildContext context) async {
    // create a new CameraPosition instance
    // every time the location changes, so the camera
    // follows the pin as it moves with an animation
    CameraPosition cPosition = CameraPosition(
      zoom: CAMERA_ZOOM,
      tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
      target: LatLng(currentLocation.latitude, currentLocation.longitude),
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
    // do this inside the setState() so Flutter gets notified
    // that a widget update is due
    setState(() {
      // updated position
      var pinPosition =
          LatLng(currentLocation.latitude, currentLocation.longitude);

      // the trick is to remove the marker (by id)
      // and add it again at the updated location
      _markers.removeWhere((m) => m.markerId.value == 'sourcePin');
      _markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          position: pinPosition, // updated position
          icon: sourceIcon));
    });
  }

  void setPolylines() async {
    List<PointLatLng> result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPIKey,
        currentLocation.latitude,
        currentLocation.longitude,
        destinationLocation.latitude,
        destinationLocation.longitude);
    if (result.isNotEmpty) {
      result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      setState(() {
        _polylines.add(Polyline(
            width: 5, // set the width of the polylines
            polylineId: PolylineId("poly"),
            color: Color.fromARGB(255, 40, 122, 198),
            points: polylineCoordinates));
      });
    }
  }

  void showPinsOnMap() {
    // get a LatLng for the source location
    // from the LocationData currentLocation object
    var pinPosition =
        LatLng(currentLocation.latitude, currentLocation.longitude);
    // get a LatLng out of the LocationData object
    var destPosition =
        LatLng(destinationLocation.latitude, destinationLocation.longitude);
    // add the initial source location pin
    _markers.add(Marker(
        markerId: MarkerId('sourcePin'),
        position: pinPosition,
        icon: sourceIcon));
    // destination pin
    _markers.add(Marker(
        markerId: MarkerId('destPin'),
        position: destPosition,
        icon: destinationIcon));
    // set the route lines on the map from source to destination

    setPolylines();
  }
}
