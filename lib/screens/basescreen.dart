import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/custom_drawer/custom_drawer.dart';
import '../models/page_maneger.dart';
import '../utility/cores.dart';

/*
  *PAGINA BASE DE CONTROLE DE NAVEGAÇÃO
*/

class BaseScreen extends StatelessWidget {
 BaseScreen({Key? key}) : super(key: key);

  //variavel de controle das pages
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManeger(pageController),
      child: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Scaffold(
            drawer: const CostomDrawer(),
            appBar: AppBar(
              title: const Text('Inicio'),
              backgroundColor:  Cores.primary,
            ),
          ),
          Scaffold(
            drawer: const CostomDrawer(),
            appBar: AppBar(
              title: const Text('Cadastro'),
              backgroundColor:  Cores.primary,
            ),
          ),
          Scaffold(
            drawer: const CostomDrawer(),
            appBar: AppBar(
              title: const Text('Listar'),
              backgroundColor:  Cores.primary,
            ),
          ),
        ],
      ),
    );
  }
}
