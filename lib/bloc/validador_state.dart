part of 'validador_bloc.dart';

abstract class ValidadorState extends Equatable {
  const ValidadorState();
  
  @override
  List<Object> get props => [];
}

class ValidadorInitial extends ValidadorState {}
