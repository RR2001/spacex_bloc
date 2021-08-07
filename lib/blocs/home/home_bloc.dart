import 'package:bloc/bloc.dart';
import 'package:spacex_bloc/blocs/home/home_events.dart';
import 'package:spacex_bloc/blocs/home/home_states.dart';
import 'package:spacex_bloc/models/launch.dart';
import 'package:spacex_bloc/repository/launch_repository.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  final LaunchRepository repo;

  HomeBloc(this.repo) : super(Loading());

  HomeStates get initialState => Loading();

  @override
  Stream<HomeStates> mapEventToState(HomeEvents event) async* {
    if (event is FetchHomeData) {
      yield Loading();
      try {
        List<Launch> resultList = await repo.fetchLaunches();
        yield LoadDataSuccess(resultList);
      } catch (e) {
        yield LoadDataFail(e.toString());
      }
    }
  }

}
