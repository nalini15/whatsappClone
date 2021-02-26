import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wclone/NavigationAnimation/navigators.dart';
import 'package:wclone/provider/appState.dart';
import 'package:wclone/screens/callScreen/callScreen.dart';
import 'package:wclone/screens/camera/cameraScreen.dart';

import 'package:wclone/screens/chat/chatScreen.dart';
import 'package:wclone/screens/popupMenu/settings.dart';
import 'package:wclone/screens/statusScreen.dart';
import 'package:wclone/styles/colors.dart';
import 'package:wclone/widgets/search.dart';

class WhatsAppHome extends StatefulWidget {
  final List<CameraDescription> cameras;
  WhatsAppHome({this.cameras});

  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool showFab = true;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        showFab = true;
      } else {
        showFab = false;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double orjWidth = MediaQuery.of(context).size.width;
    double cameraWidth = orjWidth / 24;
    double yourWidth = (orjWidth - cameraWidth) / 5;
    final states = Provider.of<AppStates>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.7,
        bottom: TabBar(
          labelColor: Colors.grey,
          isScrollable: true,
          labelPadding: EdgeInsets.symmetric(
              horizontal: (orjWidth - (cameraWidth + yourWidth * 3)) / 8),
          controller: _tabController,
          indicatorColor: primaryColor,
          unselectedLabelColor: Colors.grey,
          tabs: <Widget>[
            Container(
                width: cameraWidth,
                alignment: Alignment.center,
                child: Tab(icon: Icon(Icons.camera_alt))),
            Container(width: yourWidth, child: Tab(text: "CHATS")),
            Container(
              width: yourWidth,
              child: Tab(
                text: "STATUS",
              ),
            ),
            Container(
              width: yourWidth,
              child: Tab(
                text: "CALLS",
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                child: Text("New group"),
              ),
              PopupMenuItem(
                child: Text("New broadcast"),
              ),
              PopupMenuItem(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, FadeNavigation(widget: Settings()));
                    },
                    child: Text("Settings")),
              ),
              PopupMenuItem(
                child: GestureDetector(
                    onTap: () {
                      bool isDark = states.theme == ThemeType.DARK;
                      if (isDark) {
                        states.setTheme(ThemeType.LIGHT);
                      } else {
                        states.setTheme(ThemeType.DARK);
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text(states.theme == ThemeType.DARK
                        ? "Change Light"
                        : "Change Dark")),
              ),
            ],
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CameraScreen(widget.cameras),
          ChatScreen(),
          StatusScreen(),
          CallScreen(),
        ],
      ),
      floatingActionButton: showFab
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(
                Icons.message,
                color: Colors.white,
              ),
              onPressed: () => print("open chats"),
            )
          : null,
    );
  }
}
