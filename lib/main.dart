import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_bloc/blocs/home/home_bloc.dart';
import 'package:spacex_bloc/blocs/home/home_events.dart';
import 'package:spacex_bloc/repository/launch_repository.dart';
import 'package:spacex_bloc/screens/home_screen.dart';

void main() {

  final LaunchRepository repository = LaunchRepository();

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  
  final LaunchRepository repository;

  const MyApp({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc(repository)..add(FetchHomeData()),
        child: HomeScreen(),
      ),
    );
  }
}
