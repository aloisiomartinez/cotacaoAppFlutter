import 'package:cotacao_app/theme/colors.dart';
import 'package:flutter/material.dart';

class PageContainer extends StatelessWidget {
  final String titleText;
  final String subtitleText;
  final List<Widget> actions;
  final Widget child;

  const PageContainer(
      {Key? key,
      required this.child,
      this.actions = const [],
      required this.subtitleText,
      required this.titleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 15),
      child: Column(
        children: [
          Text(titleText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Text(subtitleText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: AppColors.text1,
                  fontSize: 18,
                  fontWeight: FontWeight.w400)),
          const SizedBox(height: 20),
          Expanded(
              child: SizedBox(
            child: child,
          )),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: actions),
          const SizedBox(
            height: 61,
          )
        ],
      ),
    );
  }
}
