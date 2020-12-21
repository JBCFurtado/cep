import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cep/models/cep.dart';
import 'package:cep/repositories/api_cep.dart';
import 'package:equatable/equatable.dart';

part 'cep_event.dart';
part 'cep_state.dart';

class CepBloc extends Bloc<CepEvent, CepState> {
  final ApiCep apiCep = ApiCep();
  CepBloc() : super(CepInitial());

  void pesquisar(String value) async{
    print(value);
    var cep = await apiCep.pesquisarCep(value);
    add(ResultadoEventCep(cep));
  }

  @override
  Stream<CepState> mapEventToState(
    CepEvent event,
  ) async* {
    if (event is PesquisarEventCep){
      pesquisar(event.value);
      yield PesquisarStateCep();
    } else if (event is ResultadoEventCep){
      yield ResultadoStateCep(event.cep);
    }
  }
}
