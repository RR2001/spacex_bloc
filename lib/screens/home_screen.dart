import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:spacex_bloc/blocs/home/home_bloc.dart';
import 'package:spacex_bloc/blocs/home/home_states.dart';
import 'package:spacex_bloc/models/launch.dart';

class HomeScreen extends StatelessWidget {
  
  AppBar _buildAppBar() {
    return AppBar(
      title: Text('GraphQL Demo'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStates>(
      builder: (BuildContext context, HomeStates state) {
        if (state is Loading) {
          return Scaffold(
            appBar: _buildAppBar(),
            body: LinearProgressIndicator(),
          );
        } else if (state is LoadDataFail) {
          return Scaffold(
            appBar: _buildAppBar(),
            body: Center(child: Text(state.error)),
          );
        } else {
          List<Launch>_data = (state as LoadDataSuccess).data;
          return Scaffold(
            appBar: _buildAppBar(),
            body: _buildBody(_data),
          );
        }
      },
    );
  }

  Widget _buildBody(List<Launch> data) {
    return Container(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          Launch item = data[index];
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              subtitle: Text(item.details),
              title: Text(item.missionName),
            ),
          );
        },
      ),
    );
  }
}
