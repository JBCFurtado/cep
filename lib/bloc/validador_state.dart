part of 'validador_bloc.dart';

enum Validador{inicial, incompleto, completo, desconhecido}
class ValidadorState extends Equatable {
  final Validador validador;
  const ValidadorState(this.validador);
  
  @override
  List<Object> get props => [validador];
}
