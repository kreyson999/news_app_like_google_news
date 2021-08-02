import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:google_news/models/models.dart';
import 'package:google_news/services/api_service.dart';
import 'package:meta/meta.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitialState());

  ApiState get initialState => ApiInitialState();

  @override
  Stream<ApiState> mapEventToState(ApiEvent event) async* {
    if (event is FetchApiEvent) {
      yield ApiLoadingState();
      try {
        List<NewsModel> news = await ApiService().getNews();
        yield ApiLoadedState(news: news);
      } catch (e) {
        yield ApiErrorState(message: e.toString());
      }
    }
  }
}
