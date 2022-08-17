import 'package:cotacao_app/cubit/app_cubit.dart';
import 'package:cotacao_app/navigator/navigator.dart';
import 'package:cotacao_app/pages/base_page.dart';
import 'package:cotacao_app/pages/cotadas_page.dart';
import 'package:cotacao_app/pages/resultado_page.dart';
import 'package:cotacao_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const CotacaoApp());
}

class CotacaoApp extends StatefulWidget {
  const CotacaoApp({Key? key}) : super(key: key);

  @override
  State<CotacaoApp> createState() => _CotacaoAppState();
}

class _CotacaoAppState extends State<CotacaoApp> {
  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit(),
      child: MaterialApp(
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: AppColors.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                minimumSize: const Size(163.0, 43.0),
                elevation: 0,
                textStyle: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 0.75)),
          ),
        ),
        home: CotacaoNavigator(
          pageController: pageController,
          pages: [
            BasePage(
              onMoedaBaseSelected: () {
                pageController.jumpToPage(1);
              },
            ),
            CotadasPage(
              onMoedasSelecionadas: () {
                pageController.jumpToPage(2);
              },
            ),
            ResultadoPage(
              onConcluirClicado: () {
                pageController.jumpToPage(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
