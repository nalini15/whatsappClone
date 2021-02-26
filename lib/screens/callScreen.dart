import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wclone/styles/colors.dart';
import '../model/callModel.dart';

class CallScreen extends StatefulWidget {
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: dummyData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(dummyData[index].img),
                          ),
                          title: Text(
                            dummyData[index].name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Row(
                            children: [
                              Text(dummyData[index].date),
                              Text(dummyData[index].time),
                              // Spacer(),
                              // Icon(
                              //   FontAwesomeIcons.video,
                              //   color: primaryColor,
                              // )
                            ],
                          ),
                          trailing: IconButton(
                              icon: Icon(FontAwesomeIcons.video,
                                  color: primaryColor),
                              onPressed: () {}),
                          onTap: () {},
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
