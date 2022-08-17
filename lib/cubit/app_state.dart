import 'package:cotacao_app/enums/moedas_enum.dart';
import 'package:cotacao_app/models/cotacao_model.dart';

enum AppStatus {
  definindoMoedas,
  cotacoesCarregando,
  cotacoesProntas,
  cotacoesError
}

class AppState {
  final MoedasEnum? moedaBase;
  final List<CotacaoModel> cotacoes;
  final AppStatus status;

  AppState({
    this.moedaBase,
    this.cotacoes = const [],
    this.status = AppStatus.definindoMoedas
  });

  AppState copyWith({
    MoedasEnum? moedaBase,
    List<CotacaoModel>? cotacoes,
    AppStatus? status
  }) {
    return AppState(
      moedaBase: moedaBase ?? this.moedaBase,
      cotacoes: cotacoes ?? this.cotacoes,
      status: status ?? this.status
    );
  }
}