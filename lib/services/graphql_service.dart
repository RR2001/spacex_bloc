import 'package:graphql/client.dart';

class GraphQLService {
  GraphQLClient? _client;

  GraphQLService() {
    HttpLink link = HttpLink('https://api.spacex.land/graphql/');

    _client =
        GraphQLClient(link: link, cache: GraphQLCache(store: InMemoryStore()));
  }

  Future<QueryResult> performQuery(String searchQuery) async {

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

    return result;
  }
}
