import 'package:flutter/material.dart';
import 'package:flutter_geo_sample/pages/map.dart';
import 'package:location/location.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage(this.title);

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  Map<String, double> currentLocation = {};
  var location = new Location();

  Widget buildLocation() {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: OutlineButton(
              child: Text('Get Current Location'),
              onPressed: () {
                location.getLocation().then((result) {
                  setState(() {
                    currentLocation = result;
                  });
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Latitude: ${currentLocation['latitude']}'),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Longitude: ${currentLocation['longitude']}'),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Accuracy: ${currentLocation['accuracy']}'),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Altitude: ${currentLocation['altitude']}'),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Speed: ${currentLocation['speed']}'),
          ),
        ],
      ),
    );
  }

  Widget buildMapButton() {
    if (currentLocation['latitude'] != null) {
      return FloatingActionButton(
        child: Icon(Icons.map),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MapPage(
              currentLocation['latitude'],
              currentLocation['longitude'],
            );
          }));
        },
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: buildLocation(),
      floatingActionButton: buildMapButton(),
    );
  }
}
