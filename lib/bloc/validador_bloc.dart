import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'validador_event.dart';
part 'validador_state.dart';

class ValidadorBloc extends Bloc<ValidadorEvent, ValidadorState> {
  ValidadorBloc() : super(ValidadorState(Validador.inicial));

  Validador validar(String value) {
    if (value.isEmpty) {
      return Validador.inicial;
    } else if (value.length > 0 && value.length < 10) {
      return Validador.incompleto;
    } else if (value.length == 10) {
      return Validador.completo;
    }
    return Validador.desconhecido;
  }

  @override
  Stream<ValidadorState> mapEventToState(
    ValidadorEvent event,
  ) async* {
    if (event is ValidadorEvent){
      yield ValidadorState(validar(event.value));
    }
  }
}
