part of 'api_bloc.dart';

@immutable
abstract class ApiEvent extends Equatable{}

class FetchApiEvent extends ApiEvent {

  @override
  List<Object> get props => [];

}
