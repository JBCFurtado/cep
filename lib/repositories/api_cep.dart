import 'package:cep/models/cep.dart';
import 'package:dio/dio.dart';

class ApiCep {
  final Dio _dio = Dio();
  Future<Cep> pesquisarCep(String value) async{
    String filtro = value.replaceAll(RegExp(r'[.-]'),'');
    print('FILTRO: $filtro');
    Response response = await _dio.get('https://viacep.com.br/ws/$filtro/json/');
    return Cep.fromJson(response.data);
  }
}