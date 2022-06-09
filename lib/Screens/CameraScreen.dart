// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(CameraScreen());
}

class CameraScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CameraPage();
  }
}

class CameraPage extends StatefulWidget {
  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Camera Screen'),
      ),
    );
  }
}
