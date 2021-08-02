part of 'api_bloc.dart';

@immutable
abstract class ApiState extends Equatable{}

class ApiInitialState extends ApiState {

  @override
  List<Object> get props => [];
}

class ApiLoadingState extends ApiState {
  @override
  List<Object> get props => [];
}

class ApiLoadedState extends ApiState {

  final List<NewsModel> news;
  ApiLoadedState({required this.news});

  @override
  List<Object> get props => [news];
}

class ApiErrorState extends ApiState {

  final String message;
  ApiErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
