// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'CallScreen.dart';
import 'CameraScreen.dart';
import 'ChatScreen.dart';
import 'StatusScreen.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomePage("Hello");
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage(this.title);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final TrackingScrollController scrollController = TrackingScrollController();
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF285C55),
      body: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                PreferredSize(
                  preferredSize: Size.fromHeight(50.0),
                  child: SliverAppBar(
                    backgroundColor: Color(0xFF285C55),
                    pinned: false,
                    title: Text('WhatsApp'),
                    actions: [
                      Container(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            SizedBox(width: 15.0),
                            Icon(Icons.more_vert),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      controller: controller,
                      unselectedLabelColor: Color(0xFF8CAAAB),
                      indicatorColor: Colors.white,
                      isScrollable: true,
                      labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      tabs: [
                        SizedBox(
                          width: 50.0,
                          child: Tab(
                            icon: Icon(
                              MdiIcons.camera,
                              size: 25.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3.5,
                          child: Tab(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'CHATS',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 5.0),
                                Container(
                                  height: 22.0,
                                  width: 22.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "12",
                                      style: TextStyle(
                                        color: Color(0xFF285C55),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3.5,
                          child: Tab(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'STATUS',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 5.0),
                                Container(
                                  height: 7.0,
                                  width: 7.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                        color: Color(0xFF285C55),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3.5,
                          child: Tab(
                            child: Text(
                              'CALLS',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  pinned: true,
                )
              ];
            },
            body: TabBarView(
              controller: controller,
              children: [
                Container(
                  color: Colors.white,
                  child: CameraScreen(),
                ),
                Container(
                  color: Colors.white,
                  child: ChatScreen(),
                ),
                Container(
                  color: Colors.white,
                  child: StatusScreen(),
                ),
                Container(
                  color: Colors.white,
                  child: CallScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color(0xFF285C55),
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
