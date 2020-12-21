part of 'cep_bloc.dart';

abstract class CepEvent extends Equatable {
  const CepEvent();

  @override
  List<Object> get props => [];
}

class PesquisarEventCep extends CepEvent {
  final String value;

  PesquisarEventCep(this.value);
  @override
  List<Object> get props => [value];
}

class ResultadoEventCep extends CepEvent {
  final Cep cep;

  ResultadoEventCep(this.cep);
  @override
  List<Object> get props => [cep];
}
