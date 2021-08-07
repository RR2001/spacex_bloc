import 'package:flutter/material.dart';
import 'package:spacex_bloc/blocs/home/home_states.dart';

import 'package:spacex_bloc/models/launch.dart';
import 'package:spacex_bloc/services/graphql_service.dart';

class LaunchRepository {
  GraphQLService? _service;

  LaunchRepository() {
    _service = GraphQLService('');
  }

  Future<List<Launch>> fetchLaunches() async {
    var result = await _service!.performQuery();

    if (result.hasException) {
      throw new Exception('Failed to get data');
    }

    List<Launch> resultList = List<Launch>.from(
        result.data!['launches'].map((launch) => Launch.fromJson(launch)));

    return resultList;
  }
}
