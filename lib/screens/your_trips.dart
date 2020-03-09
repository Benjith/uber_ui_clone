import 'package:flutter/material.dart';

class YourTrips extends StatefulWidget {
  // TabController _tabcontroller = TabController(length: 2, vsync: );
  @override
  _YourTripsState createState() => _YourTripsState();
}

class _YourTripsState extends State<YourTrips>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        bottom: PreferredSize(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      '  Your trips',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 38.0,
                          // fontFamily: 'Maven',
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                TabBar(
                  controller: _tabController,
                  labelStyle: TextStyle(fontWeight: FontWeight.normal),
                  tabs: [
                    Tab(
                      text: 'Past',
                    ),
                    Tab(
                      text: 'Upcoming',
                    ),
                  ],
                ),
              ],
            ),
            preferredSize: Size.fromHeight(100.0)),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text('You have no past trips')),
          Center(child: Text('You have no upcoming trips')),
        ],
      ),
    );
  }
}
