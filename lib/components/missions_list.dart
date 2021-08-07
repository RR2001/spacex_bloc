import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_bloc/blocs/home/home_bloc.dart';
import 'package:spacex_bloc/blocs/home/home_states.dart';
import 'package:spacex_bloc/models/launch.dart';

class MissionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStates>(
      bloc: BlocProvider.of<HomeBloc>(context),
      builder: (BuildContext context, HomeStates state) {
        if (state is Loading) {
          return const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is Empty) {
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text('No missions found'),
          );
        }
        if (state is NotEnoughChars) {
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text('Please enter at least 3 chars in the search bar'),
          );
        }
        if (state is LoadDataFail) {
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(state.error),
          );
        }
        if (state is LoadDataSuccess) {
          return state.data.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text('No misssions found'),
                )
              : Expanded(
                  child: _MissionsListResults(
                    missionList: state.data,
                  ),
                );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text('Please enter mission name'),
          );
        }
      },
    );
  }
}

class _MissionsListResults extends StatelessWidget {
  final List<Launch> missionList;

  const _MissionsListResults({Key? key, required this.missionList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: missionList.length,
      itemBuilder: (BuildContext context, int index) {
        return _MissionsSearchResultItem(
          launch: missionList[index],
        );
      },
    );
  }
}

class _MissionsSearchResultItem extends StatelessWidget {
  final Launch launch;

  const _MissionsSearchResultItem({Key? key, required this.launch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(launch.missionName),
        subtitle: Text(launch.details),
      ),
    );
  }
}
