import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
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
                    '  Payment',
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FlatButton(
            onPressed: () {},
            child: Text(
              'Add payment method',
              style: TextStyle(fontWeight: FontWeight.w300, color: Colors.blue),
            ),
          ),
          Divider(
            thickness: 2.0,
          ),
          FlatButton(
            onPressed: null,
            child: Text(
              'Trip profiles',
              // style: TextStyle(fontWeight: FontWeight.w300, color: Colors.blue),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
            title: Text('Personal'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.redeem,
                color: Colors.white,
              ),
            ),
            title: Text(
              'Ride for business',
              style: TextStyle(color: Colors.blue),
            ),
            subtitle: Text(
              'Enable business travel features',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          FlatButton(
            onPressed: null,
            child: Text(
              'Promotions',
              // style: TextStyle(fontWeight: FontWeight.w300, color: Colors.blue),
            ),
          ),
          FlatButton(
            onPressed: null,
            child: Text(
              'Add promo code',
              style: TextStyle(fontWeight: FontWeight.w300, color: Colors.blue),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          FlatButton(
            onPressed: null,
            child: Text(
              'Vouchers',
              // style: TextStyle(fontWeight: FontWeight.w300, color: Colors.blue),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.remove_from_queue,
              color: Colors.black,
            ),
            trailing: Text('0'),
            title: Text(
              'Vouchers',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
