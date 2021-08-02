import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_news/blocs/api_bloc.dart';
import 'package:google_news/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ApiBloc apiBloc;

  @override
  void initState() {
    super.initState();
    apiBloc = BlocProvider.of<ApiBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Container(
          width: MediaQuery.of(context).size.height / 5.7,
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
      body: BlocBuilder<ApiBloc, ApiState>(
        builder: (context, state) {
          if (state is ApiInitialState) {
            return buildLoading();
          } else if (state is ApiLoadingState) {
            return buildLoading();
          } else if (state is ApiLoadedState) {
            return ListView.separated(
              itemBuilder: (context, index) {
                if (state.news[index].description != null) {
                  return NewsWidget(news: state.news[index]);
                } else {
                  return Icon(Icons.error);
                }
              },
              separatorBuilder: (context, index) => DividerWidget(),
              itemCount: state.news.length,
            );
          } else if (state is ApiErrorState) {
            return Center(
              child: Text(state.message),
            );
          }
          return Center(
            child: Text("Something went wrong!"),
          );
        },
      ),
    );
  }

  Center buildLoading() => Center(
        child: CircularProgressIndicator(),
      );
}
