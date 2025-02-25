import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomedvPage extends StatefulWidget {
  @override
  _HomedvPageState createState() => _HomedvPageState();
}

class _HomedvPageState extends State<HomedvPage> {
  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var screenSize = deviceData.size;
    double width = screenSize.width;
    double height = screenSize.height;
    double aspectRatio = screenSize.aspectRatio;
    bool thisIsMobile = true;

    if (width > height) {
      thisIsMobile = false;
    } else {
      thisIsMobile = true;
    }

    // gyroscopeEvents.listen((GyroscopeEvent event) {
    //   print(event);
    // });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('width: ' + width.toString()),
            Text('height: ' + height.toString()),
            Text('aspect ratio: ' + aspectRatio.toStringAsFixed(2)),
            Text('device: ' + (thisIsMobile ? 'mobile' : 'web')),
          ],
        ),
      ),
    );
  }
}