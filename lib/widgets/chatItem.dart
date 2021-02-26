import 'package:flutter/material.dart';
import 'package:wclone/model/chatModel.dart';

class ChatItemWidget extends StatelessWidget {
  final List<ChatModel> chatModelList;
  final int index;
  final String query;

  ChatItemWidget({this.chatModelList, this.index, this.query});

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Divider(
            height: 10.0,
            indent: 70.0,
          ),
          ListTile(
            onTap: () => print('${chatModelList[index].name} is clicked'),
            leading: CircleAvatar(
              radius: 20.0,
              foregroundColor: Theme.of(context).primaryColor,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(chatModelList[index].img),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                query != null && query.isNotEmpty
                    ? RichText(
                        text: TextSpan(
                            text: chatModelList[index]
                                .name
                                .substring(0, query.length),
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0),
                            children: [
                              TextSpan(
                                  text: chatModelList[index]
                                      .name
                                      .substring(query.length),
                                  style: TextStyle(
                                      //  color: Color(Utils.primaryTextColor()),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.0))
                            ]),
                      )
                    : Text(
                        chatModelList[index].name,
                        style: TextStyle(
                            // color: Color(Utils.primaryTextColor()),
                            fontWeight: FontWeight.w500,
                            fontSize: 16.0),
                      ),
                Text(
                  chatModelList[index].time,
                  style: TextStyle(
                      //  color: Color(Utils.secondaryTextColor()),
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0),
                )
              ],
            ),
            subtitle: Container(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                chatModelList[index].message,
                style: TextStyle(
                    //  color: Color(Utils.secondaryTextColor()),
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0),
              ),
            ),
          )
        ],
      );
}
