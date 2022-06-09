// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String profileAvatarImage;
  final bool user;
  final bool seen;

  Avatar(
    this.profileAvatarImage,
    this.seen,
    this.user,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.grey[200],
          backgroundImage: NetworkImage(profileAvatarImage),
        ),
        user
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  height: 20.0,
                  width: 20.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF50b525),
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2.0,
                      color: Colors.white,
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    size: 13.0,
                    color: Colors.white,
                  ),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
