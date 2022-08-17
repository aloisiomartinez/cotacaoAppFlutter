enum MoedasEnum {
  BRL,
  USD,
  JPY,
  GBP,
  CAR
}

class moedas {
  static MoedasEnum parse(String data) {
    switch(data) {
      case 'BRL': return MoedasEnum.BRL; 
      case 'USD': return MoedasEnum.USD; 
      case 'JPY': return MoedasEnum.JPY; 
      case 'GBP': return MoedasEnum.GBP; 
      case 'CAR': return MoedasEnum.CAR; 
    }
    throw Exception('Enum $data não existe');
  }
}