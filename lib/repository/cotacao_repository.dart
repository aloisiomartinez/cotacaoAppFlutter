import 'dart:convert';

import 'package:cotacao_app/enums/moedas_enum.dart';
import 'package:cotacao_app/models/cotacao_model.dart';
import 'package:http/http.dart' as http;

class CotacaoRepository {
  Future<List<CotacaoModel>>getCotacoes({
    required MoedasEnum moedaBase,
    required List<MoedasEnum> cotadas
  }) async {
    final params = cotadas.map((cotada) => '${cotada.name}-${moedaBase.name}').join(',');
    final url = 'https://economia.awesomeapi.com.br/last/$params';
    final response = await http.get(Uri.parse(url));
    
    final json = jsonDecode(response.body) as Map<String, dynamic>;

    return json.values.map(CotacaoModel.fromJson).toList();
  }
}