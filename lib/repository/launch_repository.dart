import 'package:spacex_bloc/models/launch.dart';
import 'package:spacex_bloc/services/graphql_service.dart';

class LaunchRepository {
  GraphQLService? _service;

  LaunchRepository() {
    _service = GraphQLService();
  }

  Future<List<Launch>> fetchLaunches(searchQuery) async {
    List<Launch> resultList = await _service!.performQuery(searchQuery);

    return resultList;
  }
}
