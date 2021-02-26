import 'package:flutter/material.dart';
import 'package:wclone/widgets/chatItem.dart';
import '../model/chatModel.dart';

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = "",
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {}

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? dummyData
        : dummyData
            .where((chatModel) =>
                chatModel.name.toLowerCase().startsWith(query.toLowerCase()) ||
                chatModel.message.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ChatItemWidget(
        chatModelList: suggestionList,
        index: index,
        query: query,
      ),
    );
  }
}
