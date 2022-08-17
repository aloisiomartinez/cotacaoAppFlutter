import 'package:cotacao_app/cubit/app_cubit.dart';
import 'package:cotacao_app/cubit/app_state.dart';
import 'package:cotacao_app/enums/moedas_enum.dart';
import 'package:cotacao_app/widgets/moeda_card.dart';
import 'package:cotacao_app/widgets/page_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasePage extends StatelessWidget {
  final VoidCallback onMoedaBaseSelected;
  const BasePage({Key? key, required this.onMoedaBaseSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageContainer(
        titleText: 'Moeda base',
        subtitleText: 'Selecione uma moeda base para as conversões',
        child: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
          return ListView.builder(
              itemCount: MoedasEnum.values.length,
              itemBuilder: (context, index) {
                final moeda = MoedasEnum.values[index];
                return MoedaCard(
                  moeda: moeda,
                  selected: state.moedaBase == moeda,
                  onClicked: () async {
                    context.read<AppCubit>().setMoedaBase(moeda);
                    await Future.delayed(const Duration(milliseconds: 500));
                    onMoedaBaseSelected();
                  },
                );
              });
         }
        )
    );
  }
}
