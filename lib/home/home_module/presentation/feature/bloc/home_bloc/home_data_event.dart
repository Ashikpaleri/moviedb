part of 'home_data_bloc.dart';

abstract class HomeDataEvent extends Equatable {
  const HomeDataEvent();
}

class GetHomeData extends HomeDataEvent{
  final String ?querydata;
  const GetHomeData({this.querydata});
  @override

  List<Object?> get props => [querydata];

}