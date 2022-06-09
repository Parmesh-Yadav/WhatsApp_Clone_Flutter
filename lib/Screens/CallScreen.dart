// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/Data/Call.dart';
import 'package:whatsapp_clone_flutter/Widget/Avatar.dart';

void main() {
  runApp(CallScreen());
}

class CallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CallPage();
  }
}

class CallPage extends StatefulWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: callList.length,
        itemBuilder: (context, i) => Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 70.0),
              child: Divider(
                height: 10.0,
              ),
            ),
            ListTile(
              leading: Avatar(callList[i].userImage, true, false),
              title: Text(
                callList[i].name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Container(
                padding: EdgeInsets.only(top: 4.0),
                child: Row(
                  children: <Widget>[
                    callList[i].callrecieved
                        ? Icon(
                            Icons.call_received,
                            color: callList[i].callMissed
                                ? Colors.red
                                : Colors.green,
                          )
                        : Icon(
                            Icons.call_made,
                            color: Colors.green,
                          ),
                    Text(callList[i].time)
                  ],
                ),
              ),
              trailing: callList[i].cal
                  ? Icon(
                      Icons.call,
                      color: Color(0xFF285C55),
                    )
                  : Icon(
                      Icons.videocam,
                      color: Color(0xFF285C55),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: null,
        child: Icon(
          Icons.add_call,
          color: Colors.white,
        ),
      ),
    );
  }
}
