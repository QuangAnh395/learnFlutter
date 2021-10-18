import 'package:flutter/widgets.dart';
import 'package:flutter_training_kca/Screens/DeMoListLikeFoodBall/login_screen.dart';
import 'package:flutter_training_kca/Screens/SafeArea.dart';

import 'Screens/AnimatedContainerDeMo.dart';
import 'Screens/DeMoList/SelectScreen.dart';
import 'Screens/ExpandedDeMo.dart';
import 'Screens/ExpandedDeMo2.dart';
import 'Screens/FabDeMo.dart';
import 'Screens/FadeTransition.dart';
import 'Screens/FutureBuilderDeMo.dart';
import 'Screens/InheritedWidget/InheritedDeMo.dart';
import 'Screens/Login/LoginDeMo.dart';

import 'Screens/OpacityDeMo.dart';
import 'Screens/PageViewDeMo.dart';
import 'Screens/SliverAppBarDeMo.dart';
import 'Screens/SliverGridDeMo.dart';
import 'Screens/SliverListDeMo.dart';
import 'Screens/TableDeMo.dart';
import 'Screens/WrapDeMo.dart';
import 'Screens/date_time.dart';

class CatalogModel {
  final String widgetName;
  final Widget destinationScreen;

  const CatalogModel(
      {required this.widgetName, required this.destinationScreen});

  static List<CatalogModel> toList() {
    return [
      CatalogModel(widgetName: 'TabBarDemo Screen', destinationScreen: TabBarDemo()),
      // 22/6
      CatalogModel(widgetName: 'LoginFoot Screen', destinationScreen: LoginScreen()),
      CatalogModel(widgetName: 'Select Screen', destinationScreen: SelectScreen()),
      CatalogModel(widgetName: 'SignIn Screen', destinationScreen: LoginScreenDeMO()),
      CatalogModel(widgetName: 'SafeArea', destinationScreen: SafeAreaDeMo()),
      CatalogModel(widgetName: 'ExpendRow', destinationScreen: ExpandedDemo()),
      CatalogModel(
          widgetName: 'ExpendColumn', destinationScreen: ExpandedDeMo2()),
      CatalogModel(widgetName: 'WrapScreen', destinationScreen: WrapDeMo()),
      CatalogModel(
          widgetName: 'AnimatedContainer Screen',
          destinationScreen: AnimatedContainerScreen()),
      CatalogModel(widgetName: 'Opacity Screen', destinationScreen: OpacityDeMoScreen()),
      CatalogModel(widgetName: 'Fap Screen', destinationScreen: FabDemoScreen()),
      CatalogModel(widgetName: 'Page Screen', destinationScreen: PageViewScreen()),
      CatalogModel(widgetName: 'Table Screen', destinationScreen: TableScreen()),
      CatalogModel(widgetName: 'SliverAppBar Screen', destinationScreen: SliverAppBarScreen()),
      CatalogModel(widgetName: 'SliverList Screen', destinationScreen: SliverListScreen()),
      CatalogModel(widgetName: 'SliverGrid Screen', destinationScreen: SliverGridScreen()),
      CatalogModel(widgetName: 'Inherited Screen', destinationScreen: InheritedScreen()),
      CatalogModel(widgetName: 'FutureBuilder Screen', destinationScreen: FutureBuilderScreen()),
      CatalogModel(widgetName: 'FadeTransition Screen', destinationScreen: FadeTransitionScreen()),

    ];
  }
}
