// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatsapp_clone_flutter/Data/Status.dart';
import 'package:whatsapp_clone_flutter/Widget/Avatar.dart';

void main() {
  runApp(StatusScreen());
}

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StatusPage();
  }
}

class StatusPage extends StatefulWidget {
  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  final decoratorsOutline = BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.blue[300]!, Colors.blueAccent[200]!],
    ),
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(32.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Avatar(
                  "https://img1.looper.com/img/gallery/audi-may-have-spoiled-who-saves-tony-stark-in-avengers-4/intro-1547480934.jpg",
                  true,
                  true),
              title: Text(
                "My Status",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Container(
                padding: EdgeInsets.only(top: 4.0),
                child: Text("Tap to add status update"),
              ),
            ),
            Container(
              color: Colors.grey[300],
              height: 27.0,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.only(left: 20.0, top: 5.0),
                child: Text(
                  "View Updates",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: statusList.length,
              itemBuilder: (context, i) => Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 70.0),
                    child: Divider(height: 10.0),
                  ),
                  ListTile(
                    leading: Container(
                      decoration: statusList[i].seen ? null : decoratorsOutline,
                      child: Container(
                        padding: EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(70.0),
                          child: FadeInImage(
                            width: 45.0,
                            height: 45.0,
                            fit: BoxFit.cover,
                            placeholder: NetworkImage(
                                "https://i.ytimg.com/an_webp/g6ByRLzpoIc/mqdefault_6s.webp?du=3000&sqp=CKfPmfoF&rs=AOn4CLBdZjKxdiSAvJf9i0DGXZ8josn3CQ"),
                            image: NetworkImage(statusList[i].statusImage),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      statusList[i].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Container(
                      padding: EdgeInsets.only(top: 4.0),
                      child: Text(statusList[i].time),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: null,
            backgroundColor: Colors.white,
            child: Icon(
              MdiIcons.pencil,
              color: Color(0xFF285C55),
            ),
            heroTag: null,
          ),
          SizedBox(
            height: 10.0,
          ),
          FloatingActionButton(
            onPressed: null,
            heroTag: null,
            backgroundColor: Color(0xFF5CC856),
            child: Icon(MdiIcons.camera),
          ),
        ],
      ),
    );
  }
}
