import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_bloc/blocs/home/home_bloc.dart';
import 'package:spacex_bloc/blocs/home/home_events.dart';

class SearchBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _missionSearchController = TextEditingController();
  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _missionSearchController,
      onChanged: (text) {
        _homeBloc.add(FetchHomeData(missionName: text));
      },
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.search), hintText: 'Search mission by name'),
    );
  }

  @override
  void dispose() {
    _missionSearchController.dispose();
    super.dispose();
  }
}