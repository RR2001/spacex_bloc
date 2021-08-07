import 'package:bloc/bloc.dart';
import 'package:spacex_bloc/blocs/home/home_events.dart';
import 'package:spacex_bloc/blocs/home/home_states.dart';
import 'package:spacex_bloc/services/graphql_service.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  GraphQLService? service;

  HomeBloc() : super(Loading()) {
    service = GraphQLService();
  }

  HomeStates get initialState => Loading();

  @override
  Stream<HomeStates> mapEventToState(HomeEvents event) async* {
    if (event is FetchHomeData) {
      yield* _mapFetchHomeDataToStates(event);
    }
  }

  Stream<HomeStates> _mapFetchHomeDataToStates(FetchHomeData event) async* {
    final query = event.query;
    final variables = event.variables ?? null;

    try {
      final result = await service!.performQuery(query, variables: variables);

      if (result.hasException) {
        print('graphQLErrors: ${result.exception!.graphqlErrors.toString()}');
        yield LoadDataFail(result.exception!.graphqlErrors[0]);
      } else {
        yield LoadDataSuccess(result.data);
      }
    } catch (e) {
      print(e);
      yield LoadDataFail(e.toString());
    }
  }
}