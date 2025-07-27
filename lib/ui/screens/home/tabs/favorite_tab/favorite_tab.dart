import 'package:evently_c15/data/firestore_helper.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/event_widget.dart' show EventWidget;

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  @override
  Widget build(BuildContext context) {
    return buildEventsList();
  }

  buildEventsList() => FutureBuilder(
      future: getFavoriteEventsFromFirestore(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.hasData) {
          var events = snapshot.data ?? [];
          return ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) =>
                  EventWidget(event: events[index], onFavClick: (){
                    setState(() {});
                  },));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      });
}
