import 'package:graphql/client.dart';

class GraphQLService {
  GraphQLClient? _client;
  final String missionName;

  String? _query;

  GraphQLService(this.missionName) {
    HttpLink link = HttpLink('https://api.spacex.land/graphql/');

    _client =
        GraphQLClient(link: link, cache: GraphQLCache(store: InMemoryStore()));

    _query = """
      query {
        launches(find: {mission_name: "${this.missionName}"}, limit: 10) {
        mission_name
        details
        }
      }
      """;
  }

  Future<QueryResult> performQuery() async {
    QueryOptions options = QueryOptions(document: gql(_query!));

    final result = await _client!.query(options);

    return result;
  }
}
