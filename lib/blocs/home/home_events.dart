import 'package:equatable/equatable.dart';

abstract class HomeEvents extends Equatable {
  HomeEvents();

  @override
  List<Object> get props => [];
}

class FetchHomeData extends HomeEvents {
  final String query;
  final Map<String, dynamic>? variables;

  FetchHomeData(this.query, {this.variables}) : super();

  @override
  List<Object> get props => [query, variables ?? Map<String, dynamic>()];
}