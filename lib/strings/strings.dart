import 'package:cotacao_app/enums/moedas_enum.dart';

class Strings {
  static String parseMoeda(MoedasEnum? moeda) {
    switch (moeda) {
      case MoedasEnum.BRL:
        return 'Real';
      case MoedasEnum.USD:
        return 'Dolar Americano';
      case MoedasEnum.JPY:
        return 'Iene';
      case MoedasEnum.GBP:
        return 'Libra';
      case MoedasEnum.CAR:
        return 'Dolar Canadense';
      default:
        return "";
    }
  }
}
