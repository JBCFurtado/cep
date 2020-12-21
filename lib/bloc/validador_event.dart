part of 'validador_bloc.dart';

class ValidadorEvent extends Equatable {
  final String value;
  const ValidadorEvent(this.value);

  @override
  List<Object> get props => [value];
}
