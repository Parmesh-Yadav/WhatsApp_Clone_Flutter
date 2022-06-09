// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:whatsapp_clone_flutter/Data/Chat.dart';
import 'package:whatsapp_clone_flutter/Widget/Avatar.dart';

void main() {
  runApp(ChatScreen());
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChatPage();
  }
}

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: 100.0),
        itemCount: chatList.length,
        itemBuilder: (context, i) => Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 70.0),
              child: Divider(
                height: 10.0,
              ),
            ),
            ListTile(
              leading: Avatar(chatList[i].userImage, true, false),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    chatList[i].name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        chatList[i].time,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                        ),
                      ),
                      chatList[i].noUnseenmsg != 0
                          ? Container(
                              height: 25.0,
                              width: 25.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF61CF71),
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 1.0, color: Colors.white),
                              ),
                              child: Center(
                                child: Text(
                                  chatList[i].noUnseenmsg.toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
              subtitle: Container(
                padding: EdgeInsets.only(top: 4.0),
                child: chatScreenSubtitle(
                  chatList[i].lastMessageType,
                  chatList[i].message,
                  chatList[i].seen,
                  chatList[i].recieved,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: Color(0xFF5CC856),
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
    );
  }
}

Widget chatScreenSubtitle(String LMT, String M, bool S, bool R) {
  if (LMT == "message") {
    return Row(
      children: [
        Icon(
          R ? MdiIcons.checkAll : MdiIcons.check,
          size: 15.0,
          color: S ? Colors.blue : Colors.grey[600],
        ),
        SizedBox(
          width: 2.0,
        ),
        Text(
          M,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 15.0,
          ),
        )
      ],
    );
  } else if (LMT == "voice") {
    return Row(
      children: [
        Icon(
          Icons.keyboard_voice,
          size: 20,
          color: Color(0xFF5DB8F6),
        ),
      ],
    );
  } else if (LMT == "file") {
    return Row(
      children: [
        Icon(
          Icons.insert_drive_file,
          size: 17.0,
          color: Colors.grey,
        ),
        SizedBox(width: 7.0),
        Text(M),
      ],
    );
  } else {
    return Text(
      M,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 15.0,
      ),
    );
  }
}
