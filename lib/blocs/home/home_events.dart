import 'package:equatable/equatable.dart';

abstract class HomeEvents extends Equatable {
  HomeEvents();
}

class FetchHomeData extends HomeEvents {
  final String missionName;

  FetchHomeData({this.missionName = ''});

  @override
  List<Object> get props => [missionName];
}
