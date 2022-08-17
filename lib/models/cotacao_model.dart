import 'package:cotacao_app/enums/moedas_enum.dart';

class CotacaoModel {
  final MoedasEnum moedaBase;
  final MoedasEnum moedaCotada;
  final double valorCompra;

  CotacaoModel({
      required this.moedaBase,
      required this.moedaCotada,
      required this.valorCompra
  });

  factory CotacaoModel.fromJson(data) {
    return CotacaoModel(
      moedaBase: moedas.parse(data['codein']), 
      moedaCotada: moedas.parse(data['code']), 
      valorCompra: double.parse(data['bid'])
    );
  }
}
