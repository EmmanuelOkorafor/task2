// Copyright (c) 2024 Emanuel Okorafor. All rights reserved.
// Author: Emmanuel Okorafor







part of 'home_screen_bloc.dart';


@immutable
abstract class HomeScreenState extends Equatable {
  
  const HomeScreenState();

  @override
  List<Object?> get props => [];

}


class HomeScreenInitial extends HomeScreenState {

  const HomeScreenInitial();

  @override
  List<Object?> get props => [];

}

class HomeScreenLoading extends HomeScreenState {

  const HomeScreenLoading();

  @override
  List<Object?> get props => [];

}

class HomeScreenLoaded extends HomeScreenState {

  final HomeScreenEntity homeScreenEntity;

  const HomeScreenLoaded(this.homeScreenEntity);

  @override
  List<Object?> get props => [HomeScreenEntity];
  
}

class Err extends HomeScreenState {

  final String? message;

  const Err(this.message);

  @override 
  List<Object?> get props => [message];
  
}
