import 'package:cotacao_app/cubit/app_state.dart';
import 'package:cotacao_app/enums/moedas_enum.dart';
import 'package:cotacao_app/repository/cotacao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  final repository = CotacaoRepository();

  MoedasEnum? get moedaBase => state.moedaBase;

  void setMoedaBase(MoedasEnum moeda) {
    emit(state.copyWith(moedaBase: moeda, status: AppStatus.definindoMoedas));
  }

  Future<void> setMoedasSelecionadas(List<MoedasEnum> moedas) async {
    try {
      emit(state.copyWith(status: AppStatus.cotacoesCarregando));
      final cotacoes = await repository.getCotacoes(
          moedaBase: state.moedaBase!, cotadas: moedas);
      emit(state.copyWith(
          cotacoes: cotacoes, status: AppStatus.cotacoesProntas));
    } catch (error) {
      emit(state.copyWith(status: AppStatus.definindoMoedas));
      throw Exception();
    }
  }

  void reset() {
    emit(AppState());
  }
}
