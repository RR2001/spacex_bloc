import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_bloc/blocs/home/home_bloc.dart';
import 'package:spacex_bloc/blocs/home/home_events.dart';
import 'package:spacex_bloc/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

String query = """
  query {
  launches(find: {mission_name: ""}, limit: 10) {
    mission_name
    details
  }
}
""";

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc()..add(FetchHomeData(query)),
        child: HomeScreen(),
      ),
    );
  }
}
