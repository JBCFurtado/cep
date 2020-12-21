part of 'cep_bloc.dart';

abstract class CepState extends Equatable {
  const CepState();

  @override
  List<Object> get props => [];
}

class CepInitial extends CepState {}

class PesquisarStateCep extends CepState {}

class ResultadoStateCep extends CepState {
  final Cep cep;

  ResultadoStateCep(this.cep);

  @override
  List<Object> get props => [cep];
}
