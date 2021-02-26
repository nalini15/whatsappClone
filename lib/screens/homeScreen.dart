import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wclone/NavigationAnimation/navigators.dart';
import 'package:wclone/screens/callScreen.dart';
import 'package:wclone/screens/camera/cameraScreen.dart';

import 'package:wclone/screens/chat/chatScreen.dart';
import 'package:wclone/screens/statusScreen.dart';
import 'package:wclone/styles/colors.dart';
import 'package:wclone/widgets/search.dart';
import '../popupMenu/settings.dart';

class WhatsAppHome extends StatefulWidget {
  final List<CameraDescription> cameras;
  WhatsAppHome({this.cameras});

  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

enum Themes { light, dark }

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  ValueNotifier<Themes> _selectedItem = new ValueNotifier<Themes>(Themes.dark);
  TabController _tabController;
  bool showFab = true;

  getSelectedValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int radioValue = prefs.getInt('radio.value');
//  check if radioValue is null - no button is pressed yet, otherwise you will have selected radio value here.
  }

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
            ],
            // onSelected: (){},
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
