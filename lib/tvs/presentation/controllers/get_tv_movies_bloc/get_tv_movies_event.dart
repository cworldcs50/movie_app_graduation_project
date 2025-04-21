import 'package:equatable/equatable.dart';

class GetTvMoviesEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetOnAirTvMoviesEvent extends GetTvMoviesEvents {}

class GetPopularTvMoviesEvent extends GetTvMoviesEvents {}

class GetTopRatedTvMoviesEvent extends GetTvMoviesEvents {}
