import 'package:flutter/material.dart';
import 'package:spacex_bloc/components/missions_list.dart';
import 'package:spacex_bloc/components/search_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SpaceX Missions'),
      ),
      body: Column(
        children: <Widget>[SearchBar(), MissionsList()],
      ),
    );
  }
}