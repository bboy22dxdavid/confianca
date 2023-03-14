import 'package:flutter/cupertino.dart';

/*
  *CLASSE RESPONSAVEL POR GERENCIAR AS ROTAS
*/
class PageManeger{

   PageManeger(this._pageController);

  final PageController  _pageController;

  int page = 0;

  void setPage(int value){
    if(value == page) return;
    page = value;
    _pageController.jumpToPage(value);
  }

}