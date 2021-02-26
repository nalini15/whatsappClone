import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wclone/model/statusModel.dart';
import '../styles/colors.dart';

class StatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //  color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            // color: Theme.of(context).primaryColor,
            child: ListTile(
              leading: Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                    radius: 30,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 1,
                    child: Container(
                      child: Icon(
                        FontAwesomeIcons.plus,
                        color: secondaryColor,
                        size: 15,
                      ),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                ],
              ),
              title: Text(
                'My status',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Tap to add status update'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Recent updates',
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: dummyData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Divider(
                          color: Colors.grey,
                          height: 2,
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(dummyData[index].img),
                          ),
                          title: Text(
                            dummyData[index].name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(dummyData[index].time),
                          onTap: () {},
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
