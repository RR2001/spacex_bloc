import 'package:graphql/client.dart';
import 'package:spacex_bloc/models/launch.dart';

class GraphQLService {
  GraphQLClient? _client;

  GraphQLService() {
    HttpLink link = HttpLink('https://api.spacex.land/graphql/');

    _client =
        GraphQLClient(link: link, cache: GraphQLCache(store: InMemoryStore()));
  }

  Future<List<Launch>> performQuery(String searchQuery) async {
    String query = """
      query {
        launches(find: {mission_name: "$searchQuery"}, limit: 10) {
        mission_name
        details
        }
      }
      """;

    QueryOptions options = QueryOptions(document: gql(query));

    final result = await _client!.query(options);

    if (result.hasException) {
      throw new Exception('Failed to get data');
    }

    if (result.data == null) {
      return [];
    }

    List<Launch> resultList = List<Launch>.from(
        result.data!['launches'].map((launch) => Launch.fromJson(launch)));

    return resultList;
  }
}
