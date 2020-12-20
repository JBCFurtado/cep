import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'validador_event.dart';
part 'validador_state.dart';

class ValidadorBloc extends Bloc<ValidadorEvent, ValidadorState> {
  ValidadorBloc() : super(ValidadorInitial());

  @override
  Stream<ValidadorState> mapEventToState(
    ValidadorEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
