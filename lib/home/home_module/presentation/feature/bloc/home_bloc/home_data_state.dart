part of 'home_data_bloc.dart';

abstract class HomeDataState extends Equatable {
  const HomeDataState();
}

class HomeDataInitial extends HomeDataState {
  @override
  List<Object> get props => [];
}
class HomeDataLode extends HomeDataState {
 final HomeModel ? movieDetails;
 const HomeDataLode({this.movieDetails});
  @override
  List<Object> get props => [movieDetails!];
}
class HomeDataFail extends HomeDataState {
  @override
  List<Object> get props => [];
}
