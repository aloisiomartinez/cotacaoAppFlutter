import 'package:cotacao_app/enums/moedas_enum.dart';
import 'package:cotacao_app/strings/strings.dart';
import 'package:cotacao_app/theme/colors.dart';
import 'package:flutter/material.dart';

class MoedaCard extends StatelessWidget {
  final MoedasEnum moeda;
  final bool selected;
  final VoidCallback? onClicked;
  final double? valor;

  const MoedaCard(
      {Key? key,
      required this.moeda,
      this.selected = false,
      this.onClicked,
      this.valor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget valorWidget = const SizedBox();

    if (valor != null) {
      final color = valor! < 1
          ? AppColors.good
          : valor! < 5
              ? AppColors.warning
              : AppColors.bad;
      valorWidget = Text(
        valor!.toStringAsFixed(2),
        style:
            TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.bold),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: InkWell(
        onTap: onClicked,
        child: Container(
          height: 74.0,
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          decoration: BoxDecoration(
              color: AppColors.itemBg,
              border: selected
                  ? Border.all(width: 3.0, color: AppColors.primary)
                  : null,
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Row(
            children: [
              const Icon(
                Icons.attach_money,
                color: AppColors.text2,
                size: 30,
              ),
              const SizedBox(width: 23.0),
              Expanded(
                child: Text(
                  Strings.parseMoeda(moeda),
                  style: const TextStyle(
                      color: AppColors.text2,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
              ),
              valorWidget
            ],
          ),
        ),
      ),
    );
  }
}
