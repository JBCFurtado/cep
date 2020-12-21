import 'package:brasil_fields/brasil_fields.dart';
import 'package:cep/bloc/cep_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/validador_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final ValidadorBloc _validadorBloc =
        BlocProvider.of<ValidadorBloc>(context);
    // ignore: close_sinks
    final CepBloc _cepBloc = BlocProvider.of<CepBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesquisa CEP'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(children: [
          Container(
            margin: EdgeInsets.all(12),
            child: BlocBuilder<ValidadorBloc, ValidadorState>(
              builder: (context, state) {
                Color cor;
                Icon icon;
                switch (state.validador) {
                  case Validador.inicial:
                    cor = Colors.blue;
                    break;
                  case Validador.incompleto:
                    cor = Colors.red;
                    icon = Icon(
                      Icons.error, 
                      color: cor,
                      );
                    break;
                  case Validador.completo:
                    cor = Colors.green;
                    icon = Icon(
                      Icons.done, 
                      color: cor,
                      );
                    break;
                  default:
                  cor = Colors.amber;
                    icon = Icon(
                      Icons.warning, 
                      color: cor,
                      );
                      break;
                }
                return TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CepInputFormatter(),
                  ],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffixIcon: icon,
                    fillColor: Colors.teal[50],
                    filled: true,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: cor,
                        width: 2,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    _validadorBloc.add(ValidadorEvent(value));
                  },
                  onSubmitted: (value) {
                    if (state.validador == Validador.completo) {
                      _cepBloc.add(PesquisarEventCep(value));
                    }
                  }
                );
              },
            ),
          ),
          BlocBuilder<CepBloc, CepState>(
            builder: (context, state){
              if (state is PesquisarStateCep) {
                return Center(
                  child: CircularProgressIndicator(),
                  );
              } else if (state is ResultadoStateCep){
                return Center(
                  child: Text(state.cep.logradouro), 
                ); 
            }
            return Container();
            },
          )
        ]),
      ),
    );
  }
}
