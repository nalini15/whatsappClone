import 'package:flutter/material.dart';
import 'package:wclone/model/chatModel.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(dummyData[i].img),
              ),
              title: Row(
                children: [
                  Text(dummyData[i].name),
                  Spacer(),
                  Text(dummyData[i].time),
                ],
              ),
              subtitle: Container(child: Text(dummyData[i].message)),
            ),
            Divider(),
          ],
        );
      },
    );
  }
}
