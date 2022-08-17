import 'package:cotacao_app/cubit/app_cubit.dart';
import 'package:cotacao_app/cubit/app_state.dart';
import 'package:cotacao_app/strings/strings.dart';
import 'package:cotacao_app/widgets/moeda_card.dart';
import 'package:cotacao_app/widgets/page_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultadoPage extends StatelessWidget {
  final VoidCallback onConcluirClicado;
  const ResultadoPage({Key? key, required this.onConcluirClicado}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return PageContainer(
          titleText: 'Resultado',
          subtitleText:
              'Confira os valores de compra referentes em ${Strings.parseMoeda(state.moedaBase)}',
          actions: [
            ElevatedButton(
                onPressed: () {
                  context.read<AppCubit>().reset();
                  onConcluirClicado();
                },
                child: const Text('Concluir'))
          ],
          child: ListView.builder(
              itemCount: state.cotacoes.length,
              itemBuilder: (context, index) {
                final cotacao = state.cotacoes[index];
                return MoedaCard(
                    moeda: cotacao.moedaCotada, valor: cotacao.valorCompra);
              }),
        );
      },
    );
  }
}
