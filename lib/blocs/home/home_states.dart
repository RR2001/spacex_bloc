import 'package:equatable/equatable.dart';
import 'package:spacex_bloc/models/launch.dart';

abstract class HomeStates extends Equatable {
  HomeStates();

  @override
  List<Object> get props => [];
}

class Loading extends HomeStates {}

class NotEnoughChars extends HomeStates {}

class LoadDataSuccess extends HomeStates {
  final List<Launch> data;

  LoadDataSuccess(this.data);

  @override
  List<Object> get props => data;
}

class LoadDataFail extends HomeStates {
  final dynamic error;

  LoadDataFail(this.error);

  @override
  List<Object> get props => error;
}
