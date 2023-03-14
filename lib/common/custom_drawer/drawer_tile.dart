import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/page_maneger.dart';
import '../../utility/cores.dart';
/*
  *PAGINA DE INTENS DO DRAWER CONSTUMIZADA
  * ITENS DO  MENUS
  * ICONE
  * TEXT
*/

class DrawerTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final int page;

  const DrawerTile({Key? key, required this.iconData, required this.title, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int curPage = context.watch<PageManeger>().page;
    return InkWell(
      onTap: (){
        context.read<PageManeger>().setPage(page);
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                iconData,
                size: 32,
                color: curPage == page ? Cores.primary : Colors.grey[700],
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: curPage == page ? Cores.primary : Colors.grey[700],
              )
            )
          ],
        ),
      ),
    );
  }
}
