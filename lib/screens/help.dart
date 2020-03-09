import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        bottom: PreferredSize(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '  Help',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 38.0,
                        // fontFamily: 'Maven',
                        color: Colors.white,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ],
            ),
            preferredSize: Size.fromHeight(30.0)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            onTap: () {},
            title: Text(
              'All topics',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
            ),
          ),
          ListTile(
            onTap: () {},
            title: Text('Trip Issues and Refunds'),
          ),
          ListTile(
            onTap: () {},
            title: Text('Account and Payment Options'),
          ),
          ListTile(
            onTap: () {},
            title: Text('More'),
          ),
          ListTile(
            onTap: () {},
            title: Text('A Guide to Uber'),
          ),
          ListTile(
            onTap: () {},
            title: Text('Signing Up'),
          ),
          ListTile(
            onTap: () {},
            title: Text('Accessibility'),
          ),
        ],
      ),
    );
  }
}
