import 'package:cotacao_app/cubit/app_cubit.dart';
import 'package:cotacao_app/cubit/app_state.dart';
import 'package:cotacao_app/enums/moedas_enum.dart';
import 'package:cotacao_app/strings/strings.dart';
import 'package:cotacao_app/widgets/moeda_card.dart';
import 'package:cotacao_app/widgets/page_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CotadasPage extends StatefulWidget {
  final VoidCallback onMoedasSelecionadas;
  const CotadasPage({Key? key, required this.onMoedasSelecionadas})
      : super(key: key);

  @override
  State<CotadasPage> createState() => _CotadasPageState();
}

class _CotadasPageState extends State<CotadasPage> {
  List<MoedasEnum> selecionadas = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final moedas = MoedasEnum.values
            .where((moeda) => moeda != state.moedaBase)
            .toList();
        return PageContainer(
            titleText: 'Cotação',
            subtitleText:
                'Selecione as moedas a serem cotadas em ${Strings.parseMoeda(state.moedaBase)}',
            actions: [
              Visibility(
                visible: state.status == AppStatus.cotacoesCarregando,
                replacement: ElevatedButton(
                  child: const Text('Próximo'),
                  onPressed: () async {
                    try {
                      await context
                          .read<AppCubit>()
                          .setMoedasSelecionadas(selecionadas);
                      widget.onMoedasSelecionadas();
                    } on Exception {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text('Não é possivel carregar essas moedas')));
                    }
                  },
                ),
                child: const ElevatedButton(
                    onPressed: null, child: Text('Carregando')),
              )
            ],
            child: ListView.builder(
                itemCount: moedas.length,
                itemBuilder: (context, index) {
                  final moeda = moedas[index];
                  return MoedaCard(
                    moeda: moeda,
                    selected: selecionadas.contains(moeda),
                    onClicked: () async {
                      setState(() {
                        if (selecionadas.contains(moeda)) {
                          selecionadas.remove(moeda);
                        } else {
                          selecionadas.add(moeda);
                        }
                      });
                    },
                  );
                }));
      },
    );
  }
}
