import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:machine_test/home/home_module/data/model/home_model.dart';
import 'package:machine_test/home/home_module/data/repository/provider/home_screen_provider.dart';


part 'home_data_event.dart';
part 'home_data_state.dart';

class HomeDataBloc extends Bloc<HomeDataEvent, HomeDataState> {
  final _homeProvider = HomeProvider();
  HomeDataBloc() : super(HomeDataInitial());
  @override
  Stream<HomeDataState>mapEventToState(HomeDataEvent event) async* {
    if(event is GetHomeData){
      yield HomeDataInitial();
      try{
        final response = await _homeProvider.getPosts(searchData: event.querydata);
        if(response !=null){
          yield HomeDataLode(
            movieDetails: response
          );
        }else{
          yield HomeDataFail();
        }

      }catch(e){

        yield HomeDataFail();
      }
    }
  }
}
