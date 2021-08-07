import 'package:graphql/client.dart';

class GraphQLService {
  GraphQLClient? _client;

  GraphQLService() {
    HttpLink link = HttpLink('https://api.spacex.land/graphql/');

    _client =
        GraphQLClient(link: link, cache: GraphQLCache(store: InMemoryStore()));
  }

  Future<QueryResult> performQuery(String query,
      {Map<String, dynamic>? variables}) async {
    QueryOptions options =
        QueryOptions(document: gql(query), variables: variables ?? Map<String, dynamic>());

    final result = await _client!.query(options);

    return result;
  }
}
