import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_news/blocs/api_bloc.dart';
import 'package:google_news/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ApiBloc()..add(FetchApiEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Google News',
        home: HomeScreen(),
      ),
    );
  }
}