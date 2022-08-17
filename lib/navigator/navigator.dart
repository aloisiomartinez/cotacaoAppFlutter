import 'package:cotacao_app/theme/colors.dart';
import 'package:flutter/material.dart';

class CotacaoNavigator extends StatefulWidget {
  final PageController pageController;
  final List<Widget> pages;

  const CotacaoNavigator({
    Key? key, 
    required this.pages, 
    required this.pageController
  }) : super(key: key);

  @override
  State<CotacaoNavigator> createState() => _CotacaoNavigatorState();
}

class _CotacaoNavigatorState extends State<CotacaoNavigator> with TickerProviderStateMixin {
  late TabController tab;

  @override
  void initState() {
    super.initState();
    tab = TabController(length: 3, vsync: this);
    widget.pageController.addListener(() {
      tab.animateTo(widget.pageController.page!.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter, 
          children: [
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: widget.pageController,
              children: widget.pages,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TabPageSelector(
                controller: tab,
                indicatorSize: 24,
                color: AppColors.circleBg,
                selectedColor: AppColors.primary,
              ),
            ),
          ]
        ),
      ),
    );
  }
}
